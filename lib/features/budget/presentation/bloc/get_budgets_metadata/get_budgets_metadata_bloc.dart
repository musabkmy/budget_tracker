import 'package:bloc/bloc.dart';
import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/core/utils/localization_utils.dart';
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
  }

  Future<void> _getAllBudgetsMetadata(
      GetBudgetsMetaData event, Emitter<GetBudgetsMetadataState> emit) async {
    try {
      final dynamic result = await _budgetRepository.getBudgetsMetadata();

      // debugPrint(result.data!.toString());
      if (result is DataSuccess) {
        emit(state.copyWith(
          status: GetBudgetsMetadataStateStatus.completed,
          allBudgetsMetadata: result.data,
        ));
      } else if (result is DataFailed) {
        emit(state.copyWith(
          status: GetBudgetsMetadataStateStatus.failed,
          messageKey: getErrorMessage(result),
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: GetBudgetsMetadataStateStatus.failed));
    }
  }
}
