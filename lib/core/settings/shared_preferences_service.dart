import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late SharedPreferences _preferences;

  // Initialize SharedPreferences
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save a value
  Future<void> saveValue(String key, String value) async {
    await _preferences.setString(key, value);
  }

  // Retrieve a value
  String? getValue(String key) {
    return _preferences.getString(key);
  }

  // Remove a value
  Future<void> removeValue(String key) async {
    await _preferences.remove(key);
  }
}
