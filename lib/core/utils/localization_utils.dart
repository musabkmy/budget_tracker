import 'package:budget_tracker/core/resources/data_state.dart';
import 'package:budget_tracker/core/utils/localization_service.dart';

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
