import 'dart:io';

import 'package:budget_tracker/core/dependency_injection/di.dart';
import 'package:budget_tracker/features/budget/data/data_source/local/budget_db_provider.dart';
import 'package:budget_tracker/models/category_models/category.dart';
import 'package:budget_tracker/models/item_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'mock_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory? testDir = await testSetupDi();
  late BudgetDataBaseProvider budgetDataBaseProvider;
  Category item = Category(
      headCategoryId: defaultBudgetHeadCategory[0].id,
      localizedNames: {enLan: 'Income'},
      theme: ItemTheme(icon: Icons.attach_money_rounded, color: Colors.green));

  setUpAll(() {
    budgetDataBaseProvider = di<BudgetDataBaseProvider>();
  });
  test('Testing Hive', () async {
    debugPrint('Input ${item.toString()}');
    await budgetDataBaseProvider.insertCategories(
      post: item,
    );
    Category? result = await budgetDataBaseProvider.getCategories();
    debugPrint('Result ${result!.toString()}');
  });

  tearDownAll(() async {
    await Hive.close();
    try {
      testDir.deleteSync(recursive: true);
    } catch (e) {
      debugPrint('Ignoring deletion error: $e');
    }
  });
}
