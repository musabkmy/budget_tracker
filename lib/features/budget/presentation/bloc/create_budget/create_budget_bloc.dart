import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:budget_tracker/core/init_data/default_budget_data.dart';
import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_category.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_period.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_info.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_layouts_info.dart';
import 'package:budget_tracker/features/budget/repository/budget_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'create_budget_event.dart';
part 'create_budget_state.dart';

class CreateBudgetBloc extends Bloc<CreateBudgetEvent, CreateBudgetState> {
  final BudgetRepository _budgetRepository;
  bool nextStep = false;
  CreateBudgetBloc(this._budgetRepository)
      : super(CreateBudgetState(
            createBudgetStatus: CreateBudgetStatusInit(),
            currentSetupLayoutInfo: BudgetSetupLayoutsInfo())) {
    on<CreateDefaultBudget>(_createNewBudget);
    on<ModifyCreatedBudget>(_updateCreatedBudget);
    on<ChangeBudgetNameAndPeriod>(_changeBudgetNameAndPeriod);
    on<ToPreviousSetupLayout>(_toPreviousSetupLayout);
    on<AddBudgetCategories>(_addBudgetCategories);
  }

  Future<void> _createNewBudget(
      CreateDefaultBudget event, Emitter<CreateBudgetState> emit) async {
    try {
      debugPrint('in _createNewBudget');
      final Budget newBudget = _getDefaultBudget();
      emit(state.copyWith(newCreateBudgetStatus: CreateBudgetStatusLoading()));
      final DataState<String> result =
          await _budgetRepository.insertBudget(newBudget: newBudget);
      if (result is DataSuccess) {
        await _getBudgetAndInfo(result.data!, event, emit);
      } else if (result is DataFailed) {
        debugPrint('result: DataFailed');
        emit(state.copyWith(
            newCreateBudgetStatus: CreateBudgetStatusFailure('errorMsg')));
      }
    } catch (e) {
      emit(state.copyWith(
          newCreateBudgetStatus: CreateBudgetStatusFailure('errorMsg')));
    }
  }

  Future<void> _getBudgetAndInfo(String budgetId, CreateDefaultBudget event,
      Emitter<CreateBudgetState> emit) async {
    debugPrint('in _getBudgetAndInfo');
    try {
      final DataState<Budget> result =
          await _budgetRepository.getBudget(key: budgetId);
      if (result is DataSuccess && result.data != null) {
        emit(state.copyWith(
            newCreateBudgetStatus: CreateBudgetStatusModifiable(result.data!)));
        debugPrint('added: ${result.data!.id}');
      } else if (result is DataFailed) {
        debugPrint('in bloc: ${result.errorKey.toString()}');
        emit(state.copyWith(
            newCreateBudgetStatus: CreateBudgetStatusFailure('errorMsg')));
        debugPrint('in bloc: ${state.createBudgetStatus.toString()}');
      }
    } catch (e) {
      emit(state.copyWith(
          newCreateBudgetStatus: CreateBudgetStatusFailure('errorMsg')));
    }
  }

  void _toPreviousSetupLayout(
      ToPreviousSetupLayout event, Emitter<CreateBudgetState> emit) {
    if (state.currentSetupLayoutInfo.atHeadCategory) {
      if (state.currentSetupLayoutInfo.inFirstHeadCategory) {
        emit(state.copyWith(
            currentSetupLayoutInfo: state.currentSetupLayoutInfo.copyWith(
                layoutType: LayoutType.start, nextHeadBudgetIndex: null)));
      } else {
        emit(state.copyWith(
            currentSetupLayoutInfo: state.currentSetupLayoutInfo.copyWith(
                layoutType: LayoutType.headCategory,
                nextHeadBudgetIndex: false)));
      }
    } else if (state.currentSetupLayoutInfo.atStats ||
        state.currentSetupLayoutInfo.atFinish) {
      //pass null nextHeadBudgetIndex to get last index
      emit(state.copyWith(
          currentSetupLayoutInfo: state.currentSetupLayoutInfo.copyWith(
        layoutType: LayoutType.headCategory,
      )));
    }
  }

  void _changeBudgetNameAndPeriod(
      ChangeBudgetNameAndPeriod event, Emitter<CreateBudgetState> emit) {
    final modifiableState = state.createBudgetStatus;
    if (modifiableState is CreateBudgetStatusModifiable) {
      if ((event.name != modifiableState.budget.name) ||
          (event.budgetPeriod != modifiableState.budget.budgetPeriod)) {
        final newBudget = modifiableState.budget.copyWith(
          name: event.name,
          budgetPeriod: event.budgetPeriod,
        );
        //start modifying head categories
        final nextSetupLayout = state.currentSetupLayoutInfo.copyWith(
            layoutType: LayoutType.headCategory, nextHeadBudgetIndex: true);
        emit(
          state.copyWith(
              newCreateBudgetStatus: CreateBudgetStatusModifiable(newBudget),
              currentSetupLayoutInfo: nextSetupLayout),
        );
        debugPrint(
            'name: ${(state.createBudgetStatus as CreateBudgetStatusModifiable).budget.name}\nbudget period: ${(state.createBudgetStatus as CreateBudgetStatusModifiable).budget.budgetPeriod.toString()}');
        debugPrint(
            'next page: ${state.currentSetupLayoutInfo.layoutType}\nheadBudgetIndex: ${state.currentSetupLayoutInfo.headBudgetIndex}');
      } else {
        //start modifying head categories
        final nextSetupLayout = state.currentSetupLayoutInfo.copyWith(
            layoutType: LayoutType.headCategory, nextHeadBudgetIndex: true);
        emit(state.copyWith(currentSetupLayoutInfo: nextSetupLayout));
        debugPrint(
            'next page: ${state.currentSetupLayoutInfo.layoutType}\nheadBudgetIndex: ${state.currentSetupLayoutInfo.headBudgetIndex}');
      }
    }
  }

  void _addBudgetCategories(
      AddBudgetCategories event, Emitter<CreateBudgetState> emit) {
    final modifiableState = state.createBudgetStatus;
    if (modifiableState is CreateBudgetStatusModifiable &&
        state.currentSetupLayoutInfo.atHeadCategory) {
      //TODO: process of addding category, modifing other listenable instances

      final nextSetupLayout = state.currentSetupLayoutInfo.copyWith(
          layoutType: LayoutType.headCategory, nextHeadBudgetIndex: true);
      emit(state.copyWith(currentSetupLayoutInfo: nextSetupLayout));
    }
  }

  Future<void> _updateCreatedBudget(
      ModifyCreatedBudget event, Emitter<CreateBudgetState> emit) async {
    try {
      final modifiableState = state.createBudgetStatus;
      if (modifiableState is CreateBudgetStatusModifiable) {
        final DataState<String> result = await _budgetRepository.updateBudget(
            key: modifiableState.budget.id,
            updateBudget: modifiableState.budget);
        if (result is DataSuccess && result.data != null) {
          emit(state.copyWith(
              newCreateBudgetStatus: CreateBudgetStatusSuccess(result.data!)));
          debugPrint('added: ${result.data}');
        } else if (result is DataFailed) {
          debugPrint('in bloc: ${result.errorKey.toString()}');
          emit(state.copyWith(
              newCreateBudgetStatus: CreateBudgetStatusFailure('errorMsg')));
          debugPrint('in bloc: ${modifiableState.toString()}');
        }
      } else {
        emit(state.copyWith(
            newCreateBudgetStatus: CreateBudgetStatusFailure('errorMsg')));
      }
    } catch (e) {
      emit(state.copyWith(
          newCreateBudgetStatus: CreateBudgetStatusFailure('errorMsg')));
    }
  }

  @override
  void onChange(Change<CreateBudgetState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

Budget _getDefaultBudget() {
  final Map<String, BudgetHeadCategory> budgetHeadCategories;
  final Map<String, BudgetCategory> budgetCategories;
  (budgetHeadCategories, budgetCategories) = _getHeadAndBudgetCategories();
  return Budget(
      //must check can't create when its already used id
      id: const Uuid().v4(),
      name: defaultBudgetName,
      budgetPeriod: defaultBudgetPeriod,
      headCategories: budgetHeadCategories,
      categories: budgetCategories,
      startDate: DateTime.now(),
      allBudgetBreakdown: defaultBudgetBreakdown);
}

(Map<String, BudgetHeadCategory>, Map<String, BudgetCategory>)
    _getHeadAndBudgetCategories() {
  //get head categories
  Map<String, BudgetHeadCategory> headCategories =
      BudgetHeadCategory.getIdMap(defaultBudgetHeadCategory);

//get categories
  Map<String, BudgetCategory> categories =
      BudgetCategory.getIdMap(defaultBudgetCategory)
        //change referenced ids in head categories and categories
        ..forEach((key, value) {
          int index = defaultBudgetHeadCategory
              .indexWhere((element) => element.id == value.headCategoryId);
          value.headCategoryId = headCategories.keys.elementAt(index);
          headCategories.values.elementAt(index).categoriesId.add(key);
        });

  return (headCategories, categories);
}
