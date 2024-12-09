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

class ToPreviousSetupLayout extends CreateBudgetEvent {
  const ToPreviousSetupLayout();
}

class ChangeBudgetNameAndPeriod extends CreateBudgetEvent {
  final String name;
  final BudgetPeriod budgetPeriod;
  const ChangeBudgetNameAndPeriod(
      {required this.name, required this.budgetPeriod});
}

class AddBudgetCategories extends CreateBudgetEvent {
  final String headCategoryId;
  final Iterable<BudgetCategory> categories;
  const AddBudgetCategories(
      {required this.headCategoryId, required this.categories});
}

class ModifyCreatedBudget extends CreateBudgetEvent {
  const ModifyCreatedBudget();
}
