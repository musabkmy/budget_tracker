import 'package:budget_tracker/config/dependency_injection/di_ex.dart';
import 'package:budget_tracker/hive_helper/fields/head_category_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';

import 'category.dart';

part 'head_category.g.dart';

@HiveType(
    typeId: HiveTypes.headCategory, adapterName: HiveAdapters.headCategory)
class HeadCategory extends HiveObject {
  @HiveField(HeadCategoryFields.id)
  final String id;
  @HiveField(HeadCategoryFields.localizedNames)
  final Map<String, String> localizedNames;
  @HiveField(HeadCategoryFields.showList)
  bool showList;
  @HiveField(HeadCategoryFields.categories)
  List<Category> categories;

  HeadCategory({
    required this.id,
    required this.localizedNames,
    this.showList = false,
    required this.categories,
  });

  @override
  String toString() =>
      'HeadCategory(id: $id, localizedNames: $localizedNames, showList: $showList)';
}
