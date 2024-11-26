// ignore_for_file: public_member_api_docs, sort_constructors_first
enum BudgetPeriodType {
  week,
  biWeek,
  month,
  biMonth,
  year;
}

class BudgetPeriod {
  String label;
  final int periodInDays;
  final BudgetPeriodType budgetPeriodType;

  //can't create initiated outside
  BudgetPeriod._(this.budgetPeriodType, this.label, this.periodInDays);

  //available instances
  static final BudgetPeriod week =
      BudgetPeriod._(BudgetPeriodType.week, 'Week', 7);
  static final BudgetPeriod biWeek =
      BudgetPeriod._(BudgetPeriodType.biWeek, 'Bi-Week', 14);
  static final BudgetPeriod month =
      BudgetPeriod._(BudgetPeriodType.month, 'Month', 30);
  static final BudgetPeriod biMonth =
      BudgetPeriod._(BudgetPeriodType.biMonth, 'Bi-Month', 60);
  static final BudgetPeriod year =
      BudgetPeriod._(BudgetPeriodType.year, 'Year', 260);

  //get all available instances
  static List<BudgetPeriod> get allBudgetPeriods =>
      [week, biWeek, month, biMonth, year];
}
