// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/models/base_category_models/expense_type.dart';
import 'package:budget_tracker/models/item_theme.dart';
import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/fields/base_category_fields.dart';
import 'package:uuid/uuid.dart';

// part 'base_category_model.g.dart';

@HiveType(
    typeId: HiveTypes.baseCategory, adapterName: HiveAdapters.baseCategory)
abstract class BaseCategory extends HiveObject {
  @HiveField(BaseCategoryFields.headCategoryId)
  String headCategoryId;
  @HiveField(BaseCategoryFields.id)
  final String id;
  @HiveField(BaseCategoryFields.localizedNames)
  final Map<String, String> localizedNames;
  @HiveField(BaseCategoryFields.theme)
  ItemTheme theme;
  @HiveField(BaseCategoryFields.expenseType)
  ExpenseType expenseType;
  @HiveField(BaseCategoryFields.isSaving)
  final bool isSaving;
  @HiveField(BaseCategoryFields.isRemoved)
  bool isRemoved;

  BaseCategory({
    required this.headCategoryId,
    required this.localizedNames,
    required this.theme,
    this.expenseType = ExpenseType.variable,
    this.isSaving = false,
    this.isRemoved = false,
  }) : id = Uuid().v4();

  void changeExpenseType();
}

extension BaseCategoryExt on BaseCategory {
  bool get isFixedExpense => expenseType == ExpenseType.fixed;
  bool get isVariableExpense => expenseType == ExpenseType.variable;
}
