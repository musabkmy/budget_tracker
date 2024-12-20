import 'package:budget_tracker/core/exceptions/db_exceptions.dart';
import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/features/budget/data/data_source/local/budget_db_provider.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_metadata.dart';
import 'package:flutter/material.dart';

class BudgetRepository {
  final BudgetDataBaseProvider _budgetDataBaseProvider;
  final ExceptionItemType _exceptionItemType = ExceptionItemType.budget;
  BudgetRepository(
    this._budgetDataBaseProvider,
  );

  Future<DataState<List<BudgetMetadata>>> getBudgetsMetadata() async {
    try {
      final List<BudgetMetadata> result =
          await _budgetDataBaseProvider.getBudgetsMetadata();
      debugPrint('getBudgetsMetadata success');
      return DataSuccess(result);
    } catch (e) {
      return DataFailed('UnknownException', _exceptionItemType);
    }
  }

  Future<DataState<String>> insertBudget({required Budget newBudget}) async {
    try {
      final isInserted = await _budgetDataBaseProvider.insertBudget(
          key: newBudget.id, newBudget: newBudget);
      debugPrint('isInserted: $isInserted');
      if (isInserted) {
        return DataSuccess(newBudget.id);
      }
      return DataFailed('err', _exceptionItemType);
    } catch (e) {
      debugPrint('Error in insertBudget: ${e.toString()}');
      return DataFailed(e.toString(), _exceptionItemType);
    }
  }

  Future<DataState<Budget>> getBudget({required String key}) async {
    try {
      final budget = await _budgetDataBaseProvider.getBudget(key: key);
      return DataSuccess(budget);
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('not found in repository');
      return DataFailed(e.toString(), _exceptionItemType);
    }
  }

  ///Return [DataSuccess] with [Budget.id] when succeed
  ///Return [DataFailed] with [errorKey] when failed, call [getLocalizedMessage] to get Error Message
  Future<DataState<String>> updateBudget(
      {required String key, required Budget updateBudget}) async {
    try {
      final isUpdated = await _budgetDataBaseProvider.updateBudget(
          key: key, newBudget: updateBudget);
      debugPrint('isUpdated: $isUpdated');
      if (isUpdated) {
        return DataSuccess(updateBudget.id);
      }
      return DataFailed.unknown();
    } catch (e) {
      debugPrint('Error in insertBudget: ${e.toString()}');
      return DataFailed(e.toString(), _exceptionItemType);
    }
  }
}
