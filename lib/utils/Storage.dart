import 'package:shared_preferences/shared_preferences.dart';

// 本地缓存
class Storage {
  static Future<void> setString(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static Future<String?> getString(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static Future<void> remove(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static Future<void> clear(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
