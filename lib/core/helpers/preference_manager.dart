import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  PreferenceManager._();

  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }

  static String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return sharedPreferences.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    return sharedPreferences.getStringList(key);
  }

  static Future<bool> setBool(String key, bool value) {
    return sharedPreferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  static Future<bool> remove(String key) {
    return sharedPreferences.remove(key);
  }

  static Future<bool> clear() {
    return sharedPreferences.clear();
  }

  static bool containsKey(String key) {
    return sharedPreferences.containsKey(key);
  }
}
