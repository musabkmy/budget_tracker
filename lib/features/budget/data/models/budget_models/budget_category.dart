// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:budget_tracker/models/base_category_models/expense_type.dart';
import '../../../../../models/base_category_models/base_category_model.dart';

import 'budget_breakdown.dart';

///define what is the category relation to the budget
///[income] and [expense]
enum BudgetCategoryType { income, expense }

class BudgetCategory extends BaseCategory {
  final bool hasCustomHeadCategory;
  BudgetCategoryType budgetCategoryType;
  double balance;
  double plannedBalance;

  BudgetCategory({
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

  ///will generate a new [id] for each item
  static Map<String, BudgetCategory> getIdMap(List<BudgetCategory> temps) {
    Map<String, BudgetCategory> items = {};
    for (var element in temps) {
      var item = BudgetCategory(
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

  @override
  void changeExpenseType() {
    expenseType = isFixedExpense ? ExpenseType.variable : ExpenseType.fixed;
  }

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
