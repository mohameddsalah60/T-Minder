import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool bool) async {
    await sharedPreferences.setBool(key, bool);
  }

  static Future<void> setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  static String getString(String key) {
    return sharedPreferences.getString(key) ?? '';
  }

  static bool getData(String key) {
    return sharedPreferences.getBool(key) ?? false;
  }

  static Future<void> clearAllData() async {
    await sharedPreferences.clear();
  }
}
