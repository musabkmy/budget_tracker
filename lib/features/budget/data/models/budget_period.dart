// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:budget_tracker/features/budget/data/models/budget_period_type.dart';
import 'package:budget_tracker/hive_helper/fields/budget_period_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';

part 'budget_period.g.dart';

@HiveType(
    typeId: HiveTypes.budgetPeriod, adapterName: HiveAdapters.budgetPeriod)
class BudgetPeriod extends HiveObject {
  @HiveField(BudgetPeriodFields.label)
  String label;
  @HiveField(BudgetPeriodFields.periodInDays)
  final int periodInDays;
  @HiveField(BudgetPeriodFields.budgetPeriodType)
  final BudgetPeriodType budgetPeriodType;

  //can't create initiated outside
  BudgetPeriod._(this.budgetPeriodType, this.label, this.periodInDays);

  factory BudgetPeriod(
      BudgetPeriodType budgetPeriodType, String label, int periodInDays) {
    return BudgetPeriod._(budgetPeriodType, label, periodInDays);
  }

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

  @override
  String toString() {
    return 'BudgetPeriod(label: $label, periodInDays: $periodInDays, budgetPeriodType: $budgetPeriodType)';
  }
}
