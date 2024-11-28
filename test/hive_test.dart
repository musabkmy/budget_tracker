import 'dart:io';

import 'package:budget_tracker/config/dependency_injection/di.dart';
import 'package:budget_tracker/features/budget/data/data_source/local/budget_db_provider.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'mock_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory? testDir = await testSetupDi();
  late BudgetDataBaseProvider budgetDataBaseProvider;

  setUpAll(() {
    budgetDataBaseProvider = di<BudgetDataBaseProvider>();
  });
  test('CRUD Budget', () async {
    // 54480fc0-efd7-460e-99a5-9e909f17091f
    // await budgetDataBaseProvider.insertCategories(
    //   post: item,
    // );
    debugPrint(myBudget.id);
    debugPrint(myBudget2.id);
    // await budgetDataBaseProvider.insertBudget(newBudget: myBudget);
    // await budgetDataBaseProvider.removeAll();
    List<Budget>? allResult = await budgetDataBaseProvider.getAllBudgets();
    // Budget? result = await budgetDataBaseProvider
    //     .getBudget('fe4db581-a2bc-4a22-8bdd-e8c411fb5691');

    debugPrint('All Result ${allResult.length}');
    // debugPrint('is Equaled: ${myBudget.id == result!.id}');
    // result == null
    //     ? debugPrint('item is null')
    //     : debugPrint('Result ${result.id}');
  });

  tearDownAll(() async {
    await Hive.close();
    // try {
    //   testDir.deleteSync(recursive: true);
    // } catch (e) {
    //   debugPrint('Ignoring deletion error: $e');
    // }
  });
}
