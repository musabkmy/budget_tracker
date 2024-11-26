// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  Map<String, String> localizedNames;
  double plannedBalance;
  double currentBalance;

  BudgetBreakdown({
    required this.localizedNames,
    this.plannedBalance = 0.0,
    this.currentBalance = 0.0,
  });

  @override
  String toString() =>
      'BudgetBreakdown(localizedNames: $localizedNames, plannedBalance: $plannedBalance, currentBalance: $currentBalance)';
}
