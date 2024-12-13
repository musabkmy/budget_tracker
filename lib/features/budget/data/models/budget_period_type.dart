import 'package:budget_tracker/hive_helper/fields/budget_period_type_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

part 'budget_period_type.g.dart';

///define what is the period of the budget
///[income] and [expense]
@HiveType(
    typeId: HiveTypes.budgetPeriodType,
    adapterName: HiveAdapters.budgetPeriodType)
enum BudgetPeriodType {
  @HiveField(BudgetPeriodTypeFields.week, defaultValue: true)
  week,
  @HiveField(BudgetPeriodTypeFields.biWeek)
  biWeek,
  @HiveField(BudgetPeriodTypeFields.month)
  month,
  @HiveField(BudgetPeriodTypeFields.biMonth)
  biMonth,
  @HiveField(BudgetPeriodTypeFields.year)
  year;
}
