import 'package:budget_tracker/config/constants/db_keys.dart';
import 'package:budget_tracker/config/dependency_injection/di_ex.dart';
import 'package:budget_tracker/core/exceptions/db_exceptions.dart';
import 'package:budget_tracker/core/repos/interface_repos.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
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
          'get all: _budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty}');
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
      throw e.runtimeType;
    }
  }

  @override
  Future<Budget?> getItem({required String key}) async {
    try {
      debugPrint(
          'get item: _budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty} key: $key');
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
      throw ItemNotFoundException();
    } catch (e) {
      throw e.runtimeType;
    }
  }

  ///used when you insert a new value
  ///if you want to update excising item use [item.save()]
  @override
  Future<bool> insertItem({required String key, required Budget item}) async {
    try {
      debugPrint(
          'insert: _budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty} key: $key');
      if (_budgetsBox.isOpen) {
        await _budgetsBox.put(key, item);
        return true;
      } else {
        throw InsertFailureException;
      }
    } on InsertFailureException {
      throw InsertFailureException;
    } catch (e) {
      throw e.runtimeType;
    }
  }

  @override
  Future<bool> updateItem({required String key, required Budget item}) async {
    try {
      debugPrint(
          'update: _budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty} key: $key');
      if (await isBudgetAvailable(key)) {
        final budget = _budgetsBox.get(key);
        await budget!.save();
        return true;
      }
      throw UpdateItemException;
    } catch (e) {
      throw e.runtimeType;
    }
  }

  @override
  Future<bool> removeAll() {
    try {
      debugPrint(
          'remove all: _budgetsBox.isOpen: ${_budgetsBox.isOpen} _budgetsBox.isNotEmpty: ${_budgetsBox.isNotEmpty}');
      if (_budgetsBox.isOpen && _budgetsBox.isNotEmpty) {
        _budgetsBox.clear();
      } else {
        throw DatabaseException;
      }
    } on DatabaseException {
      throw DatabaseException;
    } catch (e) {
      debugPrint(e.toString());
      throw e.runtimeType;
    }
    throw DatabaseException;
  }

  @override
  Future<bool> removeItem({required String key, required Budget item}) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> isDataAvailable() async {
    try {
      return _budgetsBox.isOpen && _budgetsBox.isEmpty;
    } catch (e) {
      // Handle error checking box emptiness
      debugPrint('Error checking if box is empty: $e');
      throw e.runtimeType; // Return true assuming it's empty on error
    }
  }

  Future<bool> isBudgetAvailable(String key) async {
    try {
      return _budgetsBox.isOpen && _budgetsBox.containsKey(key);
    } catch (e) {
      debugPrint('Error isBudgetAvailable: $e');
      throw e.runtimeType; // Return true assuming it's empty on error
    }
  }
}
