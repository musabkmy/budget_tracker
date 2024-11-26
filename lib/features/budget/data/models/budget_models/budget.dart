// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:uuid/uuid.dart';

import 'budget_breakdown.dart';
import 'budget_category.dart';
import 'budget_head_categories.dart';
import 'budget_period.dart';

///The [Budget] class is designed to manage a budget, allowing you to plan expenses,
///track transactions, and gain insights. It supports localized names,
///categorization of budget items and tracking of transactions per day.
class Budget {
  final String id;
  final Map<String, String> localizedNames;
  final BudgetPeriod budgetPeriod;

  ///BudgetHeadCategory id,instance
  Map<String, BudgetHeadCategory> headCategories;

  ///BudgetCategory id,instance
  Map<String, BudgetCategory> categories; //int represent the transactions day
  int totalPlannedExpenses;
  int totalCurrentBalance;

  final DateTime startDate;
  final DateTime endDate;

  ///Date number,transactions ids in the day
  final Map<int, List<int>> allTransactionsInDayNumber;
  int numberOfTransactions = 0;

  ///all type of [BudgetBreakdown] according to [BudgetBreakdownType]
  ///must be notified to related [BudgetCategory] - [balance] and [plannedBalance]
  final Map<BudgetBreakdownType, BudgetBreakdown> allBudgetBreakdown;
  // bool includeOtherExpenses;
  // bool includeSavingWallets;
  // bool includeDebtWallets;

  Budget({
    required this.localizedNames,
    required this.budgetPeriod,
    required this.headCategories,
    required this.categories,
    required this.startDate,
    required this.allBudgetBreakdown,
    this.totalPlannedExpenses = 0,
    this.totalCurrentBalance = 0,
  })  : id = Uuid().v1(),
        endDate = startDate.add(Duration(days: budgetPeriod.periodInDays - 1)),
        allTransactionsInDayNumber = {
          for (int day = 0; day < budgetPeriod.periodInDays; day++) day: [],
        }; //pre defined

  @override
  String toString() {
    return 'Budget(id: $id, localizedNames: $localizedNames, budgetPeriod: $budgetPeriod, headCategories: $headCategories, categories: $categories, totalPlannedExpenses: $totalPlannedExpenses, totalCurrentBalance: $totalCurrentBalance, startDate: $startDate, endDate: $endDate, allTransactionsInDayNumber: $allTransactionsInDayNumber, numberOfTransactions: $numberOfTransactions,\n allBudgetBreakdown: $allBudgetBreakdown)';
  }
}

extension BudgetExt on Budget {
  // String getIncomeStatus;
  String get startDateIso => startDate.toIso8601String();
  String get endDateIso => endDate.toIso8601String();
  int get daysLeft => endDate.difference(startDate).inDays;
}










  // /// All Days that has a transactions
  // /// if now transactions available returns {}
  // Map<DateTime, List<Transaction>> get allTransactions {
  //   if (numberOfTransactions <= 0) {
  //     return {};
  //   }
  //   Map<DateTime, List<Transaction>> availableTransactions = {};
  //   allTransactionsInDayNumber.forEach((key, value) {
  //     if (value.isNotEmpty) {
  //       availableTransactions.addAll({startDate.add(Duration(days: key)) :value});
  //     }
  //   });
  //   return availableTransactions;
  // }

  // /// Get transactions for a specific day
  // /// if not valid day returns []
  // List<Transaction> getTransactionInDay(DateTime day) =>
  //     allTransactionsInDayNumber.containsKey(day.difference(startDate).inDays)
  //         ? allTransactionsInDayNumber[day.difference(startDate).inDays]!
  //         : [];

  // /// Add a transaction for a specific day
  // /// return [$true] if transaction done else [$false]
  // bool addTransactionInDay(DateTime day, Transaction transaction) {
  //   int dayNumber = day.difference(startDate).inDays;
  //   if (dayNumber >= 0 && dayNumber < budgetPeriod.periodInDays) {
  //     allTransactionsInDayNumber[dayNumber]!.add(transaction);
  //     numberOfTransactions += 1;
  //     return true;
  //   }
  //   return false;
  // }

  // bool deleteTransactionInDay(DateTime day, String transactionId) {
  //   //TODO: delete a transaction implementation
  //   return false;
  // }
