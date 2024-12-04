import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:budget_tracker/core/init_data/default_budget_data.dart';
import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_category.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/repository/budget_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'create_budget_event.dart';
part 'create_budget_state.dart';

class CreateBudgetBloc extends Bloc<CreateBudgetEvent, CreateBudgetState> {
  final BudgetRepository _budgetRepository;
  CreateBudgetBloc(this._budgetRepository)
      : super(CreateBudgetState(createBudgetStatus: CreateBudgetStatusInit())) {
    on<CreateDefaultBudget>(_createNewBudget);
    on<ModifyCreatedBudget>(_modifyCreatedBudget);
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
        await _getBudget(result.data!, event, emit);
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

  Future<void> _modifyCreatedBudget(
      ModifyCreatedBudget event, Emitter<CreateBudgetState> emit) async {
    try {
      if ((state.createBudgetStatus is CreateBudgetStatusModifiable)
          //  && (state.createBudgetStatus as CreateBudgetStatusModifiable)
          //             .budget
          //             .id ==
          //         event.updatedBudget.id
          ) {
        final DataState<String> result = await _budgetRepository.updateBudget(
            key: (state.createBudgetStatus as CreateBudgetStatusModifiable)
                .budget
                .id,
            updateBudget: event.updatedBudget);
        if (result is DataSuccess && result.data != null) {
          emit(state.copyWith(
              newCreateBudgetStatus: CreateBudgetStatusSuccess(result.data!)));
          debugPrint('added: ${result.data}');
        } else if (result is DataFailed) {
          debugPrint('in bloc: ${result.errorKey.toString()}');
          emit(state.copyWith(
              newCreateBudgetStatus: CreateBudgetStatusFailure('errorMsg')));
          debugPrint('in bloc: ${state.createBudgetStatus.toString()}');
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

  Future<void> _getBudget(String budgetId, CreateDefaultBudget event,
      Emitter<CreateBudgetState> emit) async {
    debugPrint('in _getBudget');
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
      localizedNames: defaultBudgetName,
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
