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

class NextBudgetHeadCategory extends CreateBudgetEvent {
  final String headCategoryId;
  final Iterable<BudgetCategory> categories;
  const NextBudgetHeadCategory(
      {required this.headCategoryId, required this.categories});
}

class ModifyBudgetCategoryPlannedBalance extends CreateBudgetEvent {
  final String headCategoryId;
  final String categoryId;
  final double newPlannedBalance;
  const ModifyBudgetCategoryPlannedBalance(
      {required this.headCategoryId,
      required this.categoryId,
      required this.newPlannedBalance});
}

class FromStatsToNextHeadCategory extends CreateBudgetEvent {
  const FromStatsToNextHeadCategory();
}

class FinishModifyingBudget extends CreateBudgetEvent {
  const FinishModifyingBudget();
}

class ResetStateEvent extends CreateBudgetEvent {
  const ResetStateEvent();
}
