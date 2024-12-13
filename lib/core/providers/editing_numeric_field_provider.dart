import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:flutter/cupertino.dart';

class EditingNumericFieldProvider with ChangeNotifier {
  String? _id;
  String? _value;
  bool _editingDone = false;
  bool _hasDot = false;

  String? get id => _id;
  String? get value => _value;
  int? get valueLength => value?.length;
  bool get isEditingDone => _editingDone;
  bool get hasDot => _hasDot;
  int get dotIndex => value == null ? -1 : value!.indexOf('.');

  ///first to call for initializing an instance
  void initInstance({required String id, required double initValue}) {
    debugPrint('in initInstance id: $id initValue $initValue');

    _id = id;
    if (initValue % 1 == 0) {
      _value = initValue.toInt().toString();
    } else {
      _value = initValue.toStringAsFixed(2);
      _hasDot = true;
    }
    notifyListeners();
  }

  ///if an instance has been initialized
  bool get isInit {
    debugPrint('at isInit ${_id == null} || ${_value == null}');
    return _id == null || _value == null ? false : true;
  }

  ///return value == '0'
  bool get isValueZero => value == '0';

  bool isFieldId(String id) {
    return isInit ? _id == id : false;
  }

  void addValue(String addValue) {
    debugPrint('--\nat editing provider: $addValue');
    if (isInit &&
        valueLength! < plannedBalanceFieldLengthLimit &&
        (!hasDot || valueLength! < dotIndex + 3)) {
      debugPrint('hasDot: $hasDot');
      debugPrint('valueLength!: ${valueLength!} < dotIndex: $dotIndex + 2');
      if (double.tryParse(addValue) != null && addValue.length == 1) {
        if (isValueZero) {
          _value = addValue;
        } else {
          _value = value! + addValue;
        }
        notifyListeners();

        debugPrint('_addDigit $value');
      } else if (addValue == '.' && !hasDot) {
        _value = value! + addValue;
        _hasDot = true;
        notifyListeners();
      }
    }
  }

  void removeValue() {
    debugPrint('at editing provider: removeValue');
    if (isInit) {
      if (value!.endsWith('.')) {
        _hasDot = false;
      }
      _value = value!.substring(0, valueLength! - 1);
      if (value == '') {
        _value = '0';
      }
      notifyListeners();
    }
  }

  void doneEditing() {
    debugPrint('editing provider: doneEditing');
    _editingDone = true;
    notifyListeners();
  }

  void clear() {
    debugPrint('editing provider: clear');

    _id = null;
    _value = null;
    _hasDot = false;
    _editingDone = false;
    notifyListeners();
  }
}
