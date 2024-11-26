import 'package:hive/hive.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/fields/styled_text_fields.dart';

import 'styled_text_key.dart';

part 'styled_text.g.dart';

///The [StyledTextKey] class is designed to define text customization
///properties for specific segments of a string using [StyledTextKey]
///
///Ex1: [text] = 'Example for custom text'
///where [styledTextKeys] = {StyledTextKey(styledText: 'custom text', isBold: true, isItalic: false)}
///will show [custom text] as [bold]
///
///Ex1: [text] = 'Example 2 for custom text'
///where [styledTextKeys] = {StyledTextKey(styledText: 'custom text', isBold: true, isItalic: true)}
///will show [custom text] as [bold] and [italic]
///
@HiveType(typeId: HiveTypes.styledText, adapterName: HiveAdapters.styledText)
class StyledText extends HiveObject {
  @HiveField(StyledTextFields.fullText)
  final String fullText;
  @HiveField(StyledTextFields.styledTextKeys)
  final Iterable<StyledTextKey> styledTextKeys;

  StyledText({required this.fullText, required this.styledTextKeys});

  ///[StyledText] initial value
  factory StyledText.initial() => StyledText(fullText: '', styledTextKeys: {});
}
