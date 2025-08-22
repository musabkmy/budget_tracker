import 'package:budget_tracker/config/localization/app_localizations.dart';

class LocalizationService {
  static late AppLocalizations _localizations;

  static void initialize(AppLocalizations localizations) {
    _localizations = localizations;
  }

  static String getInsertFailureMessage(String itemType) {
    return _localizations.insertFailureException(itemType);
  }

  static String getItemNotFoundMessage(String itemType) {
    return _localizations.itemNotFoundException(itemType);
  }

  static String getDatabaseErrorMessage() {
    return _localizations.badRequest;
  }

  static String getUnknownErrorMessage() {
    return _localizations.unknownError;
  }

  static String getBadRequestErrorMessage() {
    return _localizations.badRequest;
  }
}
