import 'package:flutter/cupertino.dart';

class AppearanceProvider with ChangeNotifier {
  bool _popupHasFocus = false;
  Color _popupBackgroundColor = Color(0xFF282E31);
  String? _fieldKey;

  ///check if there is a focus on one of popup fields
  bool get popupHasFocus => _popupHasFocus;

  ///the key of the field that has focus
  String? get fieldKey => _fieldKey;

  ///get the bottom sheet color when there is
  ///a focus on a textfield and when there no focus.
  Color get popupBackgroundColor => _popupBackgroundColor;

  void togglePopupBackgroundColor(bool hasFocus, String? fieldKey) {
    _popupHasFocus = hasFocus ? true : false;
    _fieldKey = hasFocus ? fieldKey : null;
    _popupBackgroundColor = hasFocus ? Color(0xFF131B1D) : Color(0xFF282E31);
    notifyListeners();
  }
}
