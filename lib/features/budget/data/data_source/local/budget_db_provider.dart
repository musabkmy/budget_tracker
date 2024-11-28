import 'package:budget_tracker/core/exceptions/db_exceptions.dart';
import 'package:budget_tracker/features/budget/data/data_source/local/budget_db_service.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:flutter/material.dart';

class BudgetDataBaseProvider {
  // Local Source For Home
  final BudgetDataBaseService _budgetDataBaseService;

  //TODO: Reformate
  Map<String, String> somethingWentWrong = {'en': 'Something went wrong'};
  Map<String, String> budgetNotFound = {'en': 'Budget not found'};
  Map<String, String> couldNotCreateBudget = {
    'en': 'Could not create the Budget'
  };

  BudgetDataBaseProvider({
    required BudgetDataBaseService budgetDataBaseService,
  }) : _budgetDataBaseService = budgetDataBaseService;

  Future<List<Budget>> getAllBudgets() async {
    try {
      Iterable<Budget> iterable = await _budgetDataBaseService.getAll();
      return iterable.toList();
    } catch (e) {
      debugPrint(e.toString());
      throw DatabaseException(somethingWentWrong);
    }
  }

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

  Future<Budget?> getBudget(String id) async {
    try {
      return await _budgetDataBaseService.getItem(key: id);
    } catch (e) {
      e is ItemNotFoundException
          ? throw ItemNotFoundException(budgetNotFound)
          : debugPrint(e.toString());
    }
    return null;
  }

  Future<void> insertBudget({required Budget newBudget}) async {
    try {
      await _budgetDataBaseService.insertItem(
          key: newBudget.id, item: newBudget);
    } catch (e) {
      e == 'InsertFailureException'
          ? throw InsertFailureException(couldNotCreateBudget)
          : debugPrint(e.toString());
    }
  }

  /// Is Data Available
  Future<bool> isPostDataAvailable() async {
    return await _budgetDataBaseService.isDataAvailable();
  }
}
