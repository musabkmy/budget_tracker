part of 'create_budget_bloc.dart';

sealed class CreateBudgetEvent extends Equatable {
  const CreateBudgetEvent();

  @override
  List<Object> get props => [];
}

///Creating a budget with the default values
class CreateDefaultBudget extends CreateBudgetEvent {
  const CreateDefaultBudget();
}

class ModifyCreatedBudget extends CreateBudgetEvent {
  final Budget updatedBudget;
  const ModifyCreatedBudget(this.updatedBudget);

  @override
  List<Object> get props => [updatedBudget];
}
