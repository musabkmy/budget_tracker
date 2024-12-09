import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CreateBudgetStatus {}

class CreateBudgetStatusInit extends CreateBudgetStatus {}

class CreateBudgetStatusLoading extends CreateBudgetStatus {}

class CreateBudgetStatusModifiable extends CreateBudgetStatus {
  final Budget budget;
  CreateBudgetStatusModifiable(this.budget);
}

class CreateBudgetStatusFailure extends CreateBudgetStatus {
  final String errorMsg;
  CreateBudgetStatusFailure(this.errorMsg);
}

class CreateBudgetStatusSuccess extends CreateBudgetStatus {
  final String budgetId;
  CreateBudgetStatusSuccess(this.budgetId);
}
