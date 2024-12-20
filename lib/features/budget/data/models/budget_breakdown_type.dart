import 'package:budget_tracker/hive_helper/fields/budget_breakdown_type_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

part 'budget_breakdown_type.g.dart';

///gives an insights about the budget progress in terms of '[income], [saving],
///[fixedExpense], [variableExpense] and [otherExpense]'
@HiveType(
    typeId: HiveTypes.budgetBreakdownType,
    adapterName: HiveAdapters.budgetBreakdownType)
enum BudgetBreakdownType {
  @HiveField(BudgetBreakdownTypeFields.income)
  income,
  @HiveField(BudgetBreakdownTypeFields.saving)
  saving,
  @HiveField(BudgetBreakdownTypeFields.fixedExpense)
  fixedExpense,
  @HiveField(BudgetBreakdownTypeFields.variableExpense)
  variableExpense,
  @HiveField(BudgetBreakdownTypeFields.otherExpense)
  otherExpense
}
