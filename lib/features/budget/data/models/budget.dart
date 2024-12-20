// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:budget_tracker/features/budget/data/models/budget_breakdown.dart';
import 'package:budget_tracker/features/budget/data/models/budget_breakdown_type.dart';
import 'package:budget_tracker/features/budget/data/models/budget_category.dart';
import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/data/models/budget_period.dart';
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
  @Deprecated('use [BudgetBreakdownExt] instead')
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
  //ensure modifying endDate, allTransactionsInDayNumber and numberOfTransactions

  // endDate = startDate.add(Duration(days: budgetPeriod.periodInDays - 1)),
  // allTransactionsInDayNumber = {
  //   for (int day = 0; day < budgetPeriod.periodInDays; day++) day: []
  // },
  // numberOfTransactions = 0; //pre defined

  @override
  String toString() {
    return 'Budget(id: $id, name: $name, budgetPeriod: $budgetPeriod, headCategories: $headCategories, categories: $categories, totalPlannedExpenses: $totalPlannedExpenses, totalCurrentBalance: $totalCurrentBalance, startDate: $startDate, endDate: $endDate, allTransactionsInDayNumber: $allTransactionsInDayNumber, numberOfTransactions: $numberOfTransactions)';
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

  ///get [totalPlannedBalance] in specific [headCategory]
  ///Slightly less efficient if accessed frequently
  double getHeadCategoryTotalPlannedBalance(String headCategoryId) {
    double sum = 0;
    if (headCategories.containsKey(headCategoryId)) {
      debugPrint(
          'getHeadCategoryTotalPlannedBalance: head category available $headCategoryId');
      for (var element in categories.values) {
        debugPrint(
            'getHeadCategoryTotalPlannedBalance: ${element.headCategoryId}');
        if (element.headCategoryId == headCategoryId && !element.isSaving) {
          debugPrint('getHeadCategoryTotalPlannedBalance: ${element.id}');
          sum += element.plannedBalance;
        }
      }
    }
    debugPrint('getHeadCategoryTotalPlannedBalance: $sum');
    return sum;
  }

  ///get currently total planned balance in [Budget]
  double getTotalPlannedExpenses() {
    double sum = 0;
    for (var element in headCategories.values.skip(1)) {
      sum += element.totalPlannedBalance;
    }
    return sum;
  }

  (double totalIncome, double totalPlannedExpenses)
      getIncomeAndPlannedExpenses() {
    final totalIncome = headCategories.values.first.totalPlannedBalance;

    return (totalIncome, getTotalPlannedExpenses());
  }

  ///get init [category.id] and [plannedBalance] of each [category] in [headCategory]
  Map<String, double> getHeadCategoryCategoriesInitPlannedBalance(int index) {
    Map<String, double> result = {};
    if (index < headCategoriesLength) {
      final headCategory = headCategories.values.toList().elementAt(index);
      final categoriesId = getCategoriesId(headCategory.id);
      for (var key in categoriesId) {
        if (!categories[key]!.isSaving) {
          result.addEntries(
              <String, double>{key: categories[key]!.plannedBalance}.entries);
        }
      }
      debugPrint('getHeadCategoryCategoriesInitPlannedBalance: $result');
      return result;
    }
    return {};
  }

  ///compare current and init [plannedBalance] for [categories] belong to specific [HeadCategory]
  ///return [true] if matched [false] if not
  bool isCurrentAndInitPlannedBalanceMatched(
      Map<String, double> initPlannedBalance) {
    for (var entry in initPlannedBalance.entries) {
      var key = entry.key;
      var value = entry.value;
      debugPrint(
          'isCurrentAndInitPlannedBalanceMatched: $value != ${categories[key]!.plannedBalance}');
      if (value != categories[key]!.plannedBalance) {
        return false;
      }
    }
    return true;
  }
}

extension BudgetBreakdownExt on Budget {
  ///get [BudgetBreakdownType] that is relaying to a [Category]
  ///[BudgetBreakdownType] '[income], [saving],
  ///[fixedExpense], [variableExpense] and [otherExpense]'
  BudgetBreakdownType getBreakdownTypeForCategory(String categoryId) {
    final category = categories[categoryId]!;

    return category.isIncome
        ? BudgetBreakdownType.income
        : category.isExpense
            ? category.isVariableExpense
                ? BudgetBreakdownType.variableExpense
                : BudgetBreakdownType.fixedExpense
            : category.isSaving
                ? BudgetBreakdownType.saving
                : BudgetBreakdownType.otherExpense;
  }

  /// Get the [currentBalance] and [plannedBalance] for every category that relays on [BudgetBreakdownType.income]
  (double currentBalance, double plannedBalance) get breakdownIncomeBalances {
    double totalCurrentBalance = 0;
    double totalPlannedBalance = 0;

    for (var element in categories.values) {
      if (element.isIncome) {
        totalCurrentBalance += element.balance;
        totalPlannedBalance += element.plannedBalance;
      }
    }

    return (totalCurrentBalance, totalPlannedBalance);
  }

  /// Get the [currentBalance] and [plannedBalance] for every category that relays on [BudgetBreakdownType.variableExpense]
  (double currentBalance, double plannedBalance)
      get breakdownVariableExpenseBalances {
    double totalCurrentBalance = 0;
    double totalPlannedBalance = 0;

    for (var element in categories.values) {
      if (element.isExpense && element.isVariableExpense) {
        totalCurrentBalance += element.balance;
        totalPlannedBalance += element.plannedBalance;
      }
    }

    return (totalCurrentBalance, totalPlannedBalance);
  }

  /// Get the [currentBalance] and [plannedBalance] for every category that relays on [BudgetBreakdownType.fixedExpense]
  (double currentBalance, double plannedBalance)
      get breakdownFixedExpenseBalances {
    double totalCurrentBalance = 0;
    double totalPlannedBalance = 0;

    for (var element in categories.values) {
      if (element.isExpense && !element.isFixedExpense) {
        totalCurrentBalance += element.balance;
        totalPlannedBalance += element.plannedBalance;
      }
    }

    return (totalCurrentBalance, totalPlannedBalance);
  }

  /// Get the [currentBalance] and [plannedBalance] for every category that relays on [BudgetBreakdownType.saving]
  (double currentBalance, double plannedBalance) get breakdownSavingBalances {
    double totalCurrentBalance = 0;
    double totalPlannedBalance = 0;

    for (var element in categories.values) {
      if (element.isSaving) {
        totalCurrentBalance += element.balance;
        totalPlannedBalance += element.plannedBalance;
      }
    }

    return (totalCurrentBalance, totalPlannedBalance);
  }

  /// Get the [currentBalance] and [plannedBalance] for every category that relays on [BudgetBreakdownType.otherExpense]
  (double currentBalance, double plannedBalance)
      get breakdownOtherExpenseBalances {
    double totalCurrentBalance = 0;
    double totalPlannedBalance = 0;

    for (var element in categories.values) {
      if (element.hasCustomHeadCategory) {
        totalCurrentBalance += element.balance;
        totalPlannedBalance += element.plannedBalance;
      }
    }

    return (totalCurrentBalance, totalPlannedBalance);
  }
}
