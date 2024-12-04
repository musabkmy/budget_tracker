import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/core/utils/localization_service.dart';

import '../models/styled_text.dart';

String getErrorMessage(DataFailed result) {
  switch (result.errorKey) {
    case 'InsertFailureException':
      return LocalizationService.getInsertFailureMessage(
          result.itemType.toString());
    case 'ItemNotFoundException':
      return LocalizationService.getItemNotFoundMessage(
          result.itemType.toString());
    case 'DatabaseException':
      return LocalizationService.getDatabaseErrorMessage();
    case 'UnknownException':
      return LocalizationService.getUnknownErrorMessage();
    default:
      return LocalizationService.getBadRequestErrorMessage();
  }
}

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
