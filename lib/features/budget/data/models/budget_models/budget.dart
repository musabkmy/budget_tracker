// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:budget_tracker/features/budget/data/models/budget_models/budget_breakdown.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_breakdown_type.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_category.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_period.dart';
import 'package:budget_tracker/hive_helper/fields/budget_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';

part 'budget.g.dart';

///The [Budget] class is designed to manage a budget, allowing you to plan expenses,
///track transactions, and gain insights. It supports localized names,
///categorization of budget items and tracking of transactions per day.
@HiveType(typeId: HiveTypes.budget, adapterName: HiveAdapters.budget)
class Budget extends HiveObject {
  @HiveField(BudgetFields.id)
  final String id;
  @HiveField(BudgetFields.name)
  final String name;
  @HiveField(BudgetFields.budgetPeriod)
  final BudgetPeriod budgetPeriod;

  ///BudgetHeadCategory id,instance
  @HiveField(BudgetFields.headCategories)
  Map<String, BudgetHeadCategory> headCategories;

  ///BudgetCategory id,instance
  @HiveField(BudgetFields.categories)
  Map<String, BudgetCategory> categories; //int represent the transactions day
  @HiveField(BudgetFields.totalPlannedExpenses)
  int totalPlannedExpenses;
  @HiveField(BudgetFields.totalCurrentBalance)
  int totalCurrentBalance;

  @HiveField(BudgetFields.startDate)
  final DateTime startDate;
  @HiveField(BudgetFields.endDate)
  DateTime? endDate;

  ///Date number,transactions ids in the day
  @HiveField(BudgetFields.allTransactionsInDayNumber)
  Map<int, List<int>>? allTransactionsInDayNumber;
  @HiveField(BudgetFields.numberOfTransactions)
  int? numberOfTransactions;

  ///all type of [BudgetBreakdown] according to [BudgetBreakdownType]
  ///must be notified to related [BudgetCategory] - [balance] and [plannedBalance]
  @HiveField(BudgetFields.allBudgetBreakdown)
  final Map<BudgetBreakdownType, BudgetBreakdown> allBudgetBreakdown;
  // bool includeOtherExpenses;
  // bool includeSavingWallets;
  // bool includeDebtWallets;

  Budget({
    required this.id,
    required this.name,
    required this.budgetPeriod,
    required this.headCategories,
    required this.categories,
    required this.startDate,
    required this.allBudgetBreakdown,
    this.totalPlannedExpenses = 0,
    this.totalCurrentBalance = 0,
  });
  //TODO: ensure modifying endDate, allTransactionsInDayNumber and numberOfTransactions

  // endDate = startDate.add(Duration(days: budgetPeriod.periodInDays - 1)),
  // allTransactionsInDayNumber = {
  //   for (int day = 0; day < budgetPeriod.periodInDays; day++) day: []
  // },
  // numberOfTransactions = 0; //pre defined

  @override
  String toString() {
    return 'Budget(id: $id, name: $name, budgetPeriod: $budgetPeriod, headCategories: $headCategories, categories: $categories, totalPlannedExpenses: $totalPlannedExpenses, totalCurrentBalance: $totalCurrentBalance, startDate: $startDate, endDate: $endDate, allTransactionsInDayNumber: $allTransactionsInDayNumber, numberOfTransactions: $numberOfTransactions, allBudgetBreakdown: $allBudgetBreakdown)';
  }

  @override
  bool operator ==(covariant Budget other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.budgetPeriod == budgetPeriod &&
        mapEquals(other.headCategories, headCategories) &&
        mapEquals(other.categories, categories) &&
        other.totalPlannedExpenses == totalPlannedExpenses &&
        other.totalCurrentBalance == totalCurrentBalance &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        mapEquals(
            other.allTransactionsInDayNumber, allTransactionsInDayNumber) &&
        other.numberOfTransactions == numberOfTransactions &&
        mapEquals(other.allBudgetBreakdown, allBudgetBreakdown);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        budgetPeriod.hashCode ^
        headCategories.hashCode ^
        categories.hashCode ^
        totalPlannedExpenses.hashCode ^
        totalCurrentBalance.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        allTransactionsInDayNumber.hashCode ^
        numberOfTransactions.hashCode ^
        allBudgetBreakdown.hashCode;
  }

  Budget copyWith({
    String? name,
    BudgetPeriod? budgetPeriod,
    Map<String, BudgetHeadCategory>? headCategories,
    Map<String, BudgetCategory>? categories,
    int? totalPlannedExpenses,
    int? totalCurrentBalance,
    DateTime? startDate,
    DateTime? endDate,
    Map<int, List<int>>? allTransactionsInDayNumber,
    int? numberOfTransactions,
    Map<BudgetBreakdownType, BudgetBreakdown>? allBudgetBreakdown,
  }) {
    return Budget(
      id: id,
      name: name ?? this.name,
      budgetPeriod: budgetPeriod ?? this.budgetPeriod,
      headCategories: headCategories ?? this.headCategories,
      categories: categories ?? this.categories,
      totalPlannedExpenses: totalPlannedExpenses ?? this.totalPlannedExpenses,
      totalCurrentBalance: totalCurrentBalance ?? this.totalCurrentBalance,
      startDate: startDate ?? this.startDate,
      allBudgetBreakdown: allBudgetBreakdown ?? this.allBudgetBreakdown,
    );
  }
}

extension BudgetExt on Budget {
  // String getIncomeStatus;
  int get headCategoriesLength => headCategories.length;
  String get startDateIso => startDate.toIso8601String();
  String get endDateIso => endDate!.toIso8601String();
  int get daysLeft => endDate!.difference(startDate).inDays;

  ///get all head category available categories
  List<String> getCategoriesId(String headCategoryId) =>
      headCategories.containsKey(headCategoryId)
          ? headCategories[headCategoryId]!.categoriesId
          : [];
  // categories.entries
  //     .where((entry) => entry.value.headCategoryId == headCategoryId)
  //     .map((entry) => entry.key)
  //     .toList();

  ///get planned balance
  double getCategoryPlannedBalance(String categoryId) =>
      categories.containsKey(categoryId)
          ? categories[categoryId]!.plannedBalance
          : 0;
}
