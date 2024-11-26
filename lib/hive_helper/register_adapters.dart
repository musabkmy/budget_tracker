import 'package:budget_tracker/hive_helper/expense_type_adapter.dart';
import 'package:budget_tracker/hive_helper/icon_data_adapter.dart';
import 'package:budget_tracker/models/category_models/category.dart';
import 'package:budget_tracker/models/styled_text.dart';
import 'package:budget_tracker/models/styled_text_key.dart';
import 'package:budget_tracker/models/item_theme.dart';
import 'package:budget_tracker/models/category_models/head_category.dart';
import 'package:hive_flutter/adapters.dart';

void registerAdapters() {
  Hive.registerAdapter(ItemThemeAdapter());
  Hive.registerAdapter(StyledTextKeyAdapter());
  Hive.registerAdapter(StyledTextAdapter());
  Hive.registerAdapter(HeadCategoryAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(IconDataAdapter());
  Hive.registerAdapter(ExpenseTypeAdapter());
}
