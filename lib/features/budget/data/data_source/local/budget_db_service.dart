import 'package:budget_tracker/config/constants/db_keys.dart';
import 'package:budget_tracker/config/dependency_injection/di_ex.dart';
import 'package:budget_tracker/core/exceptions/db_exceptions.dart';
import 'package:budget_tracker/core/repos/interface_repos.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BudgetDataBaseService implements InterfaceRepository<Budget> {
  /// Box Key
  static const String _key = DbKeys.dbBudgets;
  late final Box<Budget> _budgetsBox;

  BudgetDataBaseService();

  Future<void> initDataBase() async {
    try {
      _budgetsBox = await Hive.openBox<Budget>(_key);
    } catch (e) {
      throw DatabaseException;
    }
  }

  @override
  Future<Iterable<Budget>> getAll() async {
    try {
      debugPrint(
          '_budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty}');
      if (_budgetsBox.isOpen && _budgetsBox.isNotEmpty) {
        for (var element in _budgetsBox.keys) {
          debugPrint(element + ' key');
        }
        for (var element in _budgetsBox.values) {
          debugPrint('${element.id} id');
        }
        return _budgetsBox.values;
      } else {
        return {};
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Budget?> getItem({required String key}) async {
    try {
      debugPrint(
          '_budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty}');
      if (_budgetsBox.isOpen) {
        if (_budgetsBox.containsKey(key)) {
          return _budgetsBox.get(key);
        } else {
          throw ItemNotFoundException;
        }
      } else {
        return null;
      }
    } on ItemNotFoundException {
      throw ItemNotFoundException;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> insertItem({required String key, required Budget item}) async {
    try {
      debugPrint(
          '_budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty}');
      if (_budgetsBox.isOpen) {
        await _budgetsBox.put(key, item);
        // _budgetsBox.close();
      } else {
        throw InsertFailureException;
      }
      debugPrint('here');
    } on InsertFailureException {
      throw InsertFailureException;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeAll() {
    try {
      debugPrint(
          '_budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty}');
      if (_budgetsBox.isOpen && _budgetsBox.isNotEmpty) {
        debugPrint('in clear init');
        _budgetsBox.clear();
      } else {
        throw DatabaseException;
      }
    } on DatabaseException {
      throw DatabaseException;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    throw DatabaseException;
  }

  @override
  Future<void> removeItem({required String key, required Budget item}) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateItem({required String key, required Budget item}) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  Future<bool> isDataAvailable() async {
    try {
      return _budgetsBox.isEmpty;
    } catch (e) {
      // Handle error checking box emptiness
      debugPrint('Error checking if box is empty: $e');
      // logger.e('Error checking if box is empty: $e');
      return false; // Return true assuming it's empty on error
    }
  }
}
