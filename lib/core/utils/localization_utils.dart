import '../../models/styled_text.dart';

///get localized text
String getLocalString(Map<String, String> localizedString, String locale) {
  return localizedString.isEmpty
      ? ''
      : localizedString[locale] ?? localizedString.values.first;
}

StyledText getLocalStyledText(
    Map<String, StyledText> localizedStyledText, String locale) {
  return localizedStyledText.isEmpty
      ? StyledText.initial()
      : localizedStyledText[locale] ?? localizedStyledText.values.first;
}
