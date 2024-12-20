// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import 'package:budget_tracker/hive_helper/fields/budget_head_category_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';

part 'budget_head_categories.g.dart';

@HiveType(
    typeId: HiveTypes.budgetHeadCategory,
    adapterName: HiveAdapters.budgetHeadCategory)
class BudgetHeadCategory extends HiveObject {
  @HiveField(BudgetHeadCategoryFields.id)
  final String id;
  @HiveField(BudgetHeadCategoryFields.localizedNames)
  final Map<String, String> localizedNames;
  @HiveField(BudgetHeadCategoryFields.totalBalance, defaultValue: 0)
  double totalBalance;
  @HiveField(BudgetHeadCategoryFields.totalPlannedBalance, defaultValue: 0)
  double totalPlannedBalance;
  @HiveField(BudgetHeadCategoryFields.categoriesId)
  List<String> categoriesId;
  @HiveField(BudgetHeadCategoryFields.headCategoryColor)
  final Color headCategoryColor;

  BudgetHeadCategory(
      {required this.id,
      required this.localizedNames,
      this.totalBalance = 0,
      this.totalPlannedBalance = 0,
      required this.categoriesId,
      required this.headCategoryColor
      // ignore: prefer_const_constructors
      });

  ///For generating Key,Value instance from default value
  ///will generate a new [id] for each item
  static Map<String, BudgetHeadCategory> getIdMap(
      List<BudgetHeadCategory> temps) {
    Map<String, BudgetHeadCategory> items = {};
    for (var element in temps) {
      var item = BudgetHeadCategory(
          id: const Uuid().v4(),
          localizedNames: element.localizedNames,
          categoriesId: element.categoriesId,
          headCategoryColor: element.headCategoryColor);
      items[item.id] = item;
    }
    return items;
  }

  @override
  String toString() {
    return 'BudgetHeadCategory(id: $id, localizedNames: $localizedNames, totalBalance: $totalBalance, totalPlannedBalance: $totalPlannedBalance, categoriesId: $categoriesId)';
  }

  BudgetHeadCategory copyWithSameId({
    double? totalBalance,
    double? totalPlannedBalance,
    List<String>? categoriesId,
  }) {
    return BudgetHeadCategory(
      id: id,
      localizedNames: localizedNames,
      totalBalance: totalBalance ?? this.totalBalance,
      totalPlannedBalance: totalPlannedBalance ?? this.totalPlannedBalance,
      categoriesId: categoriesId ?? this.categoriesId,
      headCategoryColor: headCategoryColor,
    );
  }
}
