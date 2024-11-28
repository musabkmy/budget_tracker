import 'package:budget_tracker/features/budget/data/models/budget_models/budget_breakdown_type.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_category_type.dart';
import 'package:budget_tracker/models/base_category_models/base_category_model.dart';
import 'package:budget_tracker/models/base_category_models/expense_type.dart';
import 'package:budget_tracker/models/item_theme.dart';
import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/fields/budget_category_fields.dart';
import 'package:uuid/uuid.dart';

part 'budget_category.g.dart';

@HiveType(
    typeId: HiveTypes.budgetCategory, adapterName: HiveAdapters.budgetCategory)
class BudgetCategory extends BaseCategory {
  @HiveField(BudgetCategoryFields.hasCustomHeadCategory, defaultValue: false)
  final bool hasCustomHeadCategory;
  @HiveField(BudgetCategoryFields.budgetCategoryType,
      defaultValue: BudgetCategoryType.expense)
  BudgetCategoryType budgetCategoryType;
  @HiveField(BudgetCategoryFields.balance, defaultValue: 0)
  double balance;
  @HiveField(BudgetCategoryFields.plannedBalance, defaultValue: 0)
  double plannedBalance;

  BudgetCategory({
    required super.id,
    required super.headCategoryId,
    required super.localizedNames,
    required super.theme,
    super.expenseType,
    super.isSaving,
    super.isRemoved,
    this.hasCustomHeadCategory = false,
    this.budgetCategoryType = BudgetCategoryType.expense,
    this.balance = 0,
    this.plannedBalance = 0,
  });

  ///For generating Key,Value instance from default value
  ///will generate a new [id] for each item
  static Map<String, BudgetCategory> getIdMap(List<BudgetCategory> temps) {
    Map<String, BudgetCategory> items = {};
    for (var element in temps) {
      var item = BudgetCategory(
        id: const Uuid().v4(),
        headCategoryId: element.headCategoryId,
        localizedNames: element.localizedNames,
        theme: element.theme,
        expenseType: element.expenseType,
        isSaving: element.isSaving,
        budgetCategoryType: element.budgetCategoryType,
      );
      items[item.id] = item;
    }
    return items;
  }

  BudgetBreakdownType get budgetBreakdownType => hasCustomHeadCategory
      ? BudgetBreakdownType.otherExpense
      : isSaving
          ? BudgetBreakdownType.saving
          : isIncome
              ? BudgetBreakdownType.income
              : isFixedExpense
                  ? BudgetBreakdownType.fixedExpense
                  : BudgetBreakdownType.variousExpense;

  void updateBalance({required bool fromCard, required double balance}) {
    fromCard ? balance += balance : balance -= balance;
  }

  void setPlannedBalance({required double balance}) {
    plannedBalance = balance;
  }

  @override
  String toString() {
    return 'BudgetCategory(headCategoryId: $headCategoryId, id: $id, localizedNames: $localizedNames, theme: $theme, expenseType: $expenseType, isSaving: $isSaving, isRemoved: $isRemoved, hasCustomHeadCategory: $hasCustomHeadCategory, balance: $balance, plannedBalance: $plannedBalance)';
  }
}

extension BudgetCategoryExt on BudgetCategory {
  bool get isIncome => budgetCategoryType == BudgetCategoryType.income;
  bool get isExpense => budgetCategoryType == BudgetCategoryType.expense;
}
