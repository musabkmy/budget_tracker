import 'package:flutter/cupertino.dart';

class EditingNumericFieldProvider with ChangeNotifier {
  String? _fieldId;
  Color _popupBackgroundColor = Color(0xFF282E31);
  String? _fieldKey;

  ///the key of the field that has focus
  String? get fieldKey => _fieldKey;

  ///get the bottom sheet color when there is
  ///a focus on a textfield and when there no focus.
  Color get popupBackgroundColor => _popupBackgroundColor;

  void togglePopupBackgroundColor(bool hasFocus, String? fieldKey) {
    _fieldKey = hasFocus ? fieldKey : null;
    _popupBackgroundColor = hasFocus ? Color(0xFF131B1D) : Color(0xFF282E31);
    notifyListeners();
  }
}
