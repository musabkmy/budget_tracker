import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/fields/head_category_fields.dart';
import 'package:uuid/uuid.dart';

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
    required this.localizedNames,
    this.showList = false,
    // ignore: prefer_const_constructors
  }) : id = Uuid().v1();

  @override
  String toString() =>
      'HeadCategory(id: $id, localizedNames: $localizedNames, showList: $showList)';
}
