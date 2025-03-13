import 'package:budget_tracker/core/models/styled_text.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_info.dart';
import 'package:intl/intl.dart';

extension DoubleExt on double {
  num get priceFormat =>
      this % 1 == 0 ? toInt() : double.parse(toStringAsFixed(2));
}

extension StringExt on String {
  bool hasTheSameName(String other) => this == other;
}

///get localized text
extension LocalizedString on Map<String, String> {
  String getLocalized(String locale) {
    if (isEmpty) {
      return '';
    }
    return this[locale] ?? values.first;
  }
}

///get localized styled text
extension StyledTextExt on Map<String, StyledText> {
  StyledText getLocalized(String locale) {
    if (isEmpty) {
      return StyledText.initial();
    }
    return this[locale] ?? values.first;
  }
}

extension NewBudgetSetupInfoExt on Map<String, NewBudgetSetupInfo> {
  NewBudgetSetupInfo getItem(String key) {
    if (containsKey(key)) {
      return this[key]!;
    }
    return NewBudgetSetupInfo.empty();
  }
}

extension DateTimeExt on DateTime {
  String _getDayShortMonth(String? localeName) =>
      DateFormat.d(localeName).add_MMM().format(this);
  String getDateStartFinish(String? localeName, int length) =>
      '${_getDayShortMonth(localeName)}  -  ${add(Duration(days: length))._getDayShortMonth(localeName)}';
  String getMonth(String? localeName) =>
      DateFormat.MMMM(localeName).format(this);
  String getBiMonth(String? localeName) =>
      '${getMonth(localeName)} - ${add(Duration(days: 32)).getMonth(localeName)}';
  String getYear(String? localeName) => DateFormat.y(localeName).format(this);
}
