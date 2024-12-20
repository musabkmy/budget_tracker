import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/fields/styled_text_key_fields.dart';

part 'styled_text_key.g.dart';

///will change every part of [keyText] that contains [key] with
///the specified style
@HiveType(
    typeId: HiveTypes.styledTextKey, adapterName: HiveAdapters.styledTextKey)
class StyledTextKey extends HiveObject {
  @HiveField(StyledTextKeyFields.styledText)
  final String styledText;
  @HiveField(StyledTextKeyFields.isBold)
  final bool isBold;
  @HiveField(StyledTextKeyFields.isItalic)
  final bool isItalic;

  StyledTextKey(
      {required this.styledText, required this.isBold, required this.isItalic});
}
