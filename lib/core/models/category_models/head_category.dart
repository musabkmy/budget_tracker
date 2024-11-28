import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/fields/head_category_fields.dart';

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

  HeadCategory({
    required this.id,
    required this.localizedNames,
    this.showList = false,
    // ignore: prefer_const_constructors
  });

  @override
  String toString() =>
      'HeadCategory(id: $id, localizedNames: $localizedNames, showList: $showList)';
}
