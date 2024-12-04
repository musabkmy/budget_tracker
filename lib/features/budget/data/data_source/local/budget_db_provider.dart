import 'package:budget_tracker/core/exceptions/db_exceptions.dart';
import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/features/budget/data/data_source/local/budget_db_service.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:flutter/material.dart';

class BudgetDataBaseProvider {
  // Local Source For Home
  final BudgetDataBaseService _budgetDataBaseService;
  final exceptionItemType = ExceptionItemType.budget;

  BudgetDataBaseProvider({
    required BudgetDataBaseService budgetDataBaseService,
  }) : _budgetDataBaseService = budgetDataBaseService;

  // Future<List<Budget>> getAllBudgets() async {
  //   try {
  //     Iterable<Budget> iterable = await _budgetDataBaseService.getAll();
  //     return iterable.toList();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     throw DatabaseException();
  //   }
  // }

  Future<void> removeAll() async {
    try {
      await _budgetDataBaseService.removeAll();
      debugPrint('all Budgets deleted');
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Budgets not deleted');
      // throw DatabaseException(somethingWentWrong);
    }
  }

  Future<Budget> getBudget({required String key}) async {
    try {
      final budget = await _budgetDataBaseService.getItem(key: key);
      if (budget != null) {
        return budget;
      } else {
        throw DatabaseException;
      }
    } catch (e) {
      debugPrint('in provider: ${e.toString()}');
      rethrow;
    }
  }

  Future<bool> insertBudget(
      {required String key, required Budget newBudget}) async {
    try {
      return await _budgetDataBaseService.insertItem(
          key: newBudget.id, item: newBudget);
    } catch (e) {
      debugPrint('Error in insertBudget: ${e.toString()}');
      throw e.runtimeType;
    }
  }

  ///Return [DataSuccess] with [Budget.id] when succeed
  ///Return [DataFailed] with [errorKey] when failed, call [getLocalizedMessage] to get Error Message
  Future<bool> updateBudget(
      {required String key, required Budget newBudget}) async {
    try {
      return await _budgetDataBaseService.updateItem(key: key, item: newBudget);
    } catch (e) {
      debugPrint('Error in updateBudget: ${e.toString()}');
      throw e.runtimeType;
    }
  }

  /// Is Data Available
  Future<bool> isPostDataAvailable() async {
    return await _budgetDataBaseService.isDataAvailable();
  }
}
