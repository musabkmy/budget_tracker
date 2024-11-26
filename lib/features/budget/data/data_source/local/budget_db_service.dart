import 'package:budget_tracker/config/constants/db_keys.dart';
import 'package:budget_tracker/core/repos/interface_repos.dart';
import 'package:budget_tracker/models/category_models/category.dart';
import 'package:budget_tracker/models/category_models/head_category.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BudgetDataBaseService implements InterfaceRepository<Category> {
  /// Box Key
  static const String _key = DbKeys.dbAppCategories;

  /// Products Box
  late final Box<Category> _categoriesBox;

  BudgetDataBaseService();

  /// init DB
  Future<void> initDataBase() async {
    try {
      if (!Hive.isAdapterRegistered(CategoryAdapter().typeId)) {
        Hive.registerAdapter(CategoryAdapter());
      }
      if (!Hive.isAdapterRegistered(HeadCategoryAdapter().typeId)) {
        Hive.registerAdapter(HeadCategoryAdapter());
      }
      _categoriesBox = await Hive.openBox(_key);
      debugPrint('Success on initializing database For *ProductsModel*');
      // logger.d('Success on initializing database For *ProductsModel*');
    } catch (e) {
      // Handle initialization errors
      debugPrint('Error initializing database For *ProductModel*');
      // logger.e('Error initializing database For *ProductModel*');
    }
  }

  @override
  Future<Category?> getAll() async {
    try {
      if (_categoriesBox.isOpen && _categoriesBox.isNotEmpty) {
        return _categoriesBox.get(_key);
      } else {
        return null;
      }
    } catch (e) {
      // Handle read errors
      debugPrint('Error reading from database: $e');
      // logger.e('Error reading from database: $e');
    }

    return null;
  }

  @override
  Future<void> insertItem({required Category object}) async {
    try {
      await _categoriesBox.put(_key, object);
    } catch (e) {
      // Handle insertion errors
      debugPrint('Error inserting into database: $e');
      // logger.e('Error inserting into database: $e');
    }
  }

  @override
  Future<bool> isDataAvailable() async {
    try {
      return _categoriesBox.isEmpty;
    } catch (e) {
      // Handle error checking box emptiness
      debugPrint('Error checking if box is empty: $e');
      // logger.e('Error checking if box is empty: $e');
      return true; // Return true assuming it's empty on error
    }
  }
}
