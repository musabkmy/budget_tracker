import 'package:bloc/bloc.dart';
import 'package:budget_tracker/config/constants/sp_keys.dart';
import 'package:budget_tracker/config/dependency_injection/di.dart';
import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/core/settings/shared_preferences_service.dart';
import 'package:budget_tracker/features/budget/data/models/budget_metadata.dart';
import 'package:budget_tracker/features/budget/repository/budget_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'get_budgets_metadata_event.dart';
part 'get_budgets_metadata_state.dart';

class GetBudgetsMetadataBloc
    extends Bloc<GetBudgetsMetadataEvent, GetBudgetsMetadataState> {
  final BudgetRepository _budgetRepository;
  GetBudgetsMetadataBloc(this._budgetRepository)
      : super(GetBudgetsMetadataState(
            status: GetBudgetsMetadataStateStatus.initial)) {
    on<GetBudgetsMetaData>(_getAllBudgetsMetadata);
    on<ChangeViewedBudgetKey>(_changeViewedBudgetKey);
  }

  Future<void> _getAllBudgetsMetadata(
      GetBudgetsMetaData event, Emitter<GetBudgetsMetadataState> emit) async {
    try {
      final dynamic result = await _budgetRepository.getBudgetsMetadata();

      if (result is DataSuccess) {
        debugPrint('data retried: ${result.data!.toString()}');
        final viewedBudgetKey = await _getViewedBudgetKey();

        emit(state.copyWith(
          status: GetBudgetsMetadataStateStatus.completed,
          allBudgetsMetadata: result.data,
          viewedBudgetKey: viewedBudgetKey ?? result.data.first.key,
        ));
      } else if (result is DataFailed) {
        emit(state.copyWith(
          status: GetBudgetsMetadataStateStatus.failed,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: GetBudgetsMetadataStateStatus.failed));
    }
  }

  Future<String?> _getViewedBudgetKey() async {
    try {
      final prefsService = di<SharedPreferencesService>();
      final viewedBudgetKey = prefsService.getValue(SpKeys.viewedBudgetKey);
      //check shared preferences if there a previous saved key
      if (viewedBudgetKey != null && viewedBudgetKey.isNotEmpty) {
        return viewedBudgetKey;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> _changeViewedBudgetKey(ChangeViewedBudgetKey event,
      Emitter<GetBudgetsMetadataState> emit) async {
    try {
      final prefsService = di<SharedPreferencesService>();
      prefsService.saveValue(SpKeys.viewedBudgetKey, event.key);
      emit(state.copyWith(viewedBudgetKey: event.key));
      debugPrint(state.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
