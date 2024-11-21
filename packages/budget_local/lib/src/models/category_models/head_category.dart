// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budget_local/src/models/category.dart';
import 'package:uuid/uuid.dart';

class HeadBudgetCategory {
  final String id;
  final String name;
  double totalBalance;
  double totalPlannedBalance;
  bool showList;
  List<BudgetCategory>? budgetCategory;

  HeadBudgetCategory({
    required this.name,
    this.totalBalance = 0,
    this.totalPlannedBalance = 0,
    this.showList = false,
    this.budgetCategory,
    // ignore: prefer_const_constructors
  }) : id = Uuid().v1();
}

extension HeadBudgetCategoryExt on HeadBudgetCategory {
  void addTotalBalance(BudgetCategory category) {
    if (category.headBudgetId == id) {
      totalBalance += category.totalBalance;
    }
  }

  void addPPlannedBalance(BudgetCategory category) {
    if (category.headBudgetId == id) {
      totalBalance += category.plannedBalance;
    }
  }
}
