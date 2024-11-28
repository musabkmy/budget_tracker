import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/fields/budget_breakdown_fields.dart';

part 'budget_breakdown.g.dart';

@HiveType(
    typeId: HiveTypes.budgetBreakdown,
    adapterName: HiveAdapters.budgetBreakdown)
class BudgetBreakdown extends HiveObject {
  @HiveField(BudgetBreakdownFields.localizedNames)
  Map<String, String> localizedNames;
  @HiveField(BudgetBreakdownFields.plannedBalance)
  double plannedBalance;
  @HiveField(BudgetBreakdownFields.currentBalance)
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
