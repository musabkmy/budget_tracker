import 'package:bloc/bloc.dart';
import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/core/utils/localization_utils.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/repository/budget_repository.dart';
import 'package:equatable/equatable.dart';

part 'get_budget_event.dart';
part 'get_budget_state.dart';

class GetBudgetBloc extends Bloc<GetBudgetEvent, GetBudgetState> {
  final BudgetRepository _budgetRepository;
  GetBudgetBloc(this._budgetRepository)
      : super(GetBudgetState(status: GetBudgetStateStatus.initial)) {
    on<GetBudgetData>(_getBudgetData);
    on<ChangeBudgetViewCurrentLayout>(_changeCurrentLayout);
  }

  Future<void> _getBudgetData(
      GetBudgetData event, Emitter<GetBudgetState> emit) async {
    try {
      final dynamic result = await _budgetRepository.getBudget(key: event.key);
      if (result is DataSuccess) {
        emit(state.copyWith(
          status: GetBudgetStateStatus.completed,
          budget: result.data,
        ));
      } else if (result is DataFailed) {
        emit(state.copyWith(
          status: GetBudgetStateStatus.failed,
          errorMessage: getErrorMessage(result),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: GetBudgetStateStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }

  void _changeCurrentLayout(
      ChangeBudgetViewCurrentLayout event, Emitter<GetBudgetState> emit) {
    emit(state.copyWith(currentLayout: event.layout));
  }
}
