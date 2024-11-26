import 'package:budget_tracker/models/base_category_models/expense_type.dart';
import 'package:budget_tracker/models/item_theme.dart';
import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import '../base_category_models/base_category_model.dart';

part 'category.g.dart';

@HiveType(typeId: HiveTypes.category, adapterName: HiveAdapters.category)
class Category extends BaseCategory {
  Category({
    required super.headCategoryId,
    required super.localizedNames,
    required super.theme,
    super.expenseType,
    super.isSaving,
    super.isRemoved,
  });

  @override
  void changeExpenseType() {
    expenseType = isFixedExpense ? ExpenseType.variable : ExpenseType.fixed;
  }

  @override
  String toString() {
    return 'Category(id: $id headCategoryId: $headCategoryId,localizedNames: $localizedNames, theme: $theme,expenseType: $expenseType,isSaving: $isSaving,isRemoved: $isRemoved)';
  }
}
