import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:budget_tracker/config/dependency_injection/di.dart';
import 'package:budget_tracker/config/dependency_injection/di_ex.dart';
import 'package:budget_tracker/core/init_data/default_budget_data.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_category.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

void main() {
  group(CreateBudgetBloc, () {
    late Directory testDir;
    late CreateBudgetBloc createBudgetBloc;

    setUpAll(() async {
      testDir = await testSetupDi(); // Initialize test DI setup
      createBudgetBloc = di<CreateBudgetBloc>();
    });

    blocTest<CreateBudgetBloc, CreateBudgetState>(
      'should create and retrieve a default budget',
      build: () => createBudgetBloc,
      act: (bloc) async {
        createBudgetBloc.add(const CreateDefaultBudget());
        await expectLater(
          createBudgetBloc.stream,
          emitsThrough(predicate((state) => (state as CreateBudgetState)
              .createBudgetStatus is CreateBudgetStatusModifiable)),
        );
        createBudgetBloc.add(ModifyCreatedBudget(_getDefaultBudget()));
        await expectLater(
          createBudgetBloc.stream,
          emitsThrough(predicate((state) => (state as CreateBudgetState)
              .createBudgetStatus is CreateBudgetStatusSuccess)),
        );
      },
      // expect: () {
      //   CreateBudgetState(createBudgetStatus: CreateBudgetStatusInit());
      //   CreateBudgetState(createBudgetStatus: CreateBudgetStatusLoading());
      // CreateBudgetState(createBudgetStatus: CreateBudgetStatusModifiable);
      // },
    );

    // test('should create and retrieve a default budget', () async {
    //   // List to store emitted states
    //   final List<CreateBudgetState> emittedStates = [];

    //   // Subscribe to the bloc's stream
    //   final subscription = createBudgetBloc.stream.listen(emittedStates.add);

    //   // Trigger the event
    //   createBudgetBloc.add(const CreateDefaultBudget());

    //   // Wait for the bloc to process the event
    //   // await Future.delayed(const Duration(
    //   //     milliseconds: 500)); // Allow time for the bloc to process

    //   // Assertions
    //   expect(
    //       emittedStates.length,
    //       greaterThanOrEqualTo(
    //           2)); // Ensure at least two states are emitted (e.g. loading -> success)
    //   expect(emittedStates[0],
    //       CreateBudgetStatusInit); // First state should be 'loading'
    //   expect(emittedStates[1], CreateBudgetStatusLoading);
    //   expect(emittedStates.last,
    //       CreateBudgetStatusModifiable); // Last state should be 'success'

    //   // Clean up the subscription
    //   await subscription.cancel();
    // });

    tearDownAll(() async {
      await Hive.close(); // Close Hive instance
      try {
        testDir.deleteSync(recursive: true); // Clean up directory
      } catch (e) {
        debugPrint('Ignoring deletion error: $e');
      }
    });
  });
}

//335bf6f9-7362-44e9-ae17-de8dff595342

Budget _getDefaultBudget() {
  final Map<String, BudgetHeadCategory> budgetHeadCategories;
  final Map<String, BudgetCategory> budgetCategories;
  (budgetHeadCategories, budgetCategories) = _getHeadAndBudgetCategories();
  return Budget(
      //must check can't create when its already used id
      id: const Uuid().v4(),
      localizedNames: defaultBudgetName,
      budgetPeriod: defaultBudgetPeriod,
      headCategories: budgetHeadCategories,
      categories: budgetCategories,
      startDate: DateTime.now(),
      allBudgetBreakdown: defaultBudgetBreakdown);
}

(Map<String, BudgetHeadCategory>, Map<String, BudgetCategory>)
    _getHeadAndBudgetCategories() {
  //get head categories
  Map<String, BudgetHeadCategory> headCategories =
      BudgetHeadCategory.getIdMap(defaultBudgetHeadCategory);

//get categories
  Map<String, BudgetCategory> categories =
      BudgetCategory.getIdMap(defaultBudgetCategory)
        //change referenced ids in head categories and categories
        ..forEach((key, value) {
          int index = defaultBudgetHeadCategory
              .indexWhere((element) => element.id == value.headCategoryId);
          value.headCategoryId = headCategories.keys.elementAt(index);
          headCategories.values.elementAt(index).categoriesId.add(key);
        });

  return (headCategories, categories);
}
