import 'package:budget_tracker/hive_helper/fields/budget_category_type_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

part 'budget_category_type.g.dart';

@HiveType(
    typeId: HiveTypes.budgetCategoryType,
    adapterName: HiveAdapters.budgetCategoryType)

///define what is the category relation to the budget
///[income] and [expense]
enum BudgetCategoryType {
  @HiveField(BudgetCategoryTypeFields.income)
  income,
  @HiveField(BudgetCategoryTypeFields.expense)
  expense
}
