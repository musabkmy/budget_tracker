import 'package:flutter/material.dart' show Color, IconData;
import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/fields/item_theme_fields.dart';

part 'item_theme.g.dart';

@HiveType(typeId: HiveTypes.itemTheme, adapterName: HiveAdapters.itemTheme)
class ItemTheme extends HiveObject {
  @HiveField(ItemThemeFields.color)
  final Color color;
  @HiveField(ItemThemeFields.icon)
  final IconData icon;

  ItemTheme({
    required this.icon,
    required this.color,
  });

  @override
  String toString() => 'ItemTheme(color: $color, icon: $icon)';
}
