import 'package:flutter/cupertino.dart';

class FocusNodesManagerProvider extends ChangeNotifier {
  final _keyFocusNodes = <String, FocusNode>{};
  final _keyFocusNodeStates = <String, bool>{};

  Map<String, FocusNode> get focusNodes => _keyFocusNodes;
  Map<String, bool> get focusStates => _keyFocusNodeStates;

  void addFocusNode(String key, FocusNode focusNode) {
    _keyFocusNodes[key] = focusNode;
    focusNode.addListener(() {
      _keyFocusNodeStates[key] = focusNode.hasFocus;
      notifyListeners();
    });
    // notifyListeners();
  }

  void removeFocusNode(String key) {
    _keyFocusNodes.remove(key);
    notifyListeners();
  }

  void disposeAll() {
    for (var focusNode in _keyFocusNodes.entries) {
      focusNode.value.dispose();
    }
    _keyFocusNodes.clear();
    _keyFocusNodeStates.clear();
    notifyListeners();
  }
}
