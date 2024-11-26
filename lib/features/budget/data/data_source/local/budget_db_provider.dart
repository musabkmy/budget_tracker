import 'package:budget_tracker/features/budget/data/data_source/local/budget_db_service.dart';
import 'package:budget_tracker/models/category_models/category.dart';
import 'package:flutter/material.dart';

class BudgetDataBaseProvider {
  // Local Source For Home
  final BudgetDataBaseService _budgetDataBaseService;

  BudgetDataBaseProvider({
    required BudgetDataBaseService budgetDataBaseService,
  }) : _budgetDataBaseService = budgetDataBaseService;

  /// Read From DB
  Future<Category?> getCategories() async {
    try {
      return await _budgetDataBaseService.getAll();
    } catch (e) {
      // Log or handle the error appropriately
      debugPrint('Error retrieving categories: $e');
      // logger.e('Error retrieving categories: $e');
      return null;
    }
  }

  /// Insert To DB
  Future<void> insertCategories({required Category post}) async {
    try {
      await _budgetDataBaseService.insertItem(object: post);
    } catch (e) {
      // Handle insertion errors
      debugPrint('Error inserting Products: $e');
      // logger.e('Error inserting Products: $e');
    }
  }

  /// Is Data Available
  Future<bool> isPostDataAvailable() async {
    return await _budgetDataBaseService.isDataAvailable();
  }
}
