///gives an insights about the budget progress in terms of 'income, saving,
///fixed expense, variable expense and other expense'
enum BudgetBreakdownType {
  income,
  saving,
  fixedExpense,
  variousExpense,
  otherExpense
}

class BudgetBreakdown {
  final BudgetBreakdownType type;
  double plannedBalance;
  double currentBalance;
  //can't be initiated
  const BudgetBreakdown._(this.type, this.plannedBalance, this.currentBalance);

  //
  // Define constant instances
  static const BudgetBreakdown income =
      BudgetBreakdown._(BudgetBreakdownType.income, 0.0, 0.0);
  static const BudgetBreakdown saving =
      BudgetBreakdown._(BudgetBreakdownType.saving, 0.0, 0.0);
  static const BudgetBreakdown fixedExpense =
      BudgetBreakdown._(BudgetBreakdownType.fixedExpense, 0.0, 0.0);
  static const BudgetBreakdown variousExpense =
      BudgetBreakdown._(BudgetBreakdownType.variousExpense, 0.0, 0.0);
  static const BudgetBreakdown otherExpense =
      BudgetBreakdown._(BudgetBreakdownType.otherExpense, 0.0, 0.0);

  // Method to get all types
  static List<BudgetBreakdown> get allBudgetBreakdown =>
      [income, saving, fixedExpense, variousExpense, otherExpense];
}
