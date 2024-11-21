// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

enum ExpenseType { fixed, variable }

class BudgetCategory {
  final String headBudgetId;
  final String id;
  final String name;
  ExpenseType expenseType;
  double totalBalance;
  double plannedBalance;

  BudgetCategory({
    required this.headBudgetId,
    required this.name,
    this.expenseType = ExpenseType.fixed,
    this.totalBalance = 0,
    this.plannedBalance = 0,
    // ignore: prefer_const_constructors
  }) : id = Uuid().v1();
}

extension BudgetCategoryExt on BudgetCategory {
  // void changeName(String newName) {
  //   name = newName;
  // }

  void updateTotalBalance({required bool fromCard, required double balance}) {
    fromCard ? totalBalance += balance : totalBalance -= balance;
  }

  void setPlannedBalance({required double balance}) {
    plannedBalance = balance;
  }
}
