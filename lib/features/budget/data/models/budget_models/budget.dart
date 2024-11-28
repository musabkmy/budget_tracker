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
  @HiveField(BudgetFields.localizedNames)
  final Map<String, String> localizedNames;
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
  final DateTime endDate;

  ///Date number,transactions ids in the day
  @HiveField(BudgetFields.allTransactionsInDayNumber)
  final Map<int, List<int>> allTransactionsInDayNumber;
  int numberOfTransactions = 0;

  ///all type of [BudgetBreakdown] according to [BudgetBreakdownType]
  ///must be notified to related [BudgetCategory] - [balance] and [plannedBalance]
  @HiveField(BudgetFields.allBudgetBreakdown)
  final Map<BudgetBreakdownType, BudgetBreakdown> allBudgetBreakdown;
  // bool includeOtherExpenses;
  // bool includeSavingWallets;
  // bool includeDebtWallets;

  Budget({
    required this.id,
    required this.localizedNames,
    required this.budgetPeriod,
    required this.headCategories,
    required this.categories,
    required this.startDate,
    required this.allBudgetBreakdown,
    this.totalPlannedExpenses = 0,
    this.totalCurrentBalance = 0,
  })  : endDate = startDate.add(Duration(days: budgetPeriod.periodInDays - 1)),
        allTransactionsInDayNumber = {
          for (int day = 0; day < budgetPeriod.periodInDays; day++) day: [],
        }; //pre defined

  @override
  String toString() {
    return 'Budget(id: $id, localizedNames: $localizedNames, budgetPeriod: $budgetPeriod, headCategories: $headCategories, categories: $categories, totalPlannedExpenses: $totalPlannedExpenses, totalCurrentBalance: $totalCurrentBalance, startDate: $startDate, endDate: $endDate, allTransactionsInDayNumber: $allTransactionsInDayNumber, numberOfTransactions: $numberOfTransactions,\n allBudgetBreakdown: $allBudgetBreakdown)';
  }

  @override
  bool operator ==(covariant Budget other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        mapEquals(other.localizedNames, localizedNames) &&
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
        localizedNames.hashCode ^
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
}

extension BudgetExt on Budget {
  // String getIncomeStatus;
  String get startDateIso => startDate.toIso8601String();
  String get endDateIso => endDate.toIso8601String();
  int get daysLeft => endDate.difference(startDate).inDays;
}
