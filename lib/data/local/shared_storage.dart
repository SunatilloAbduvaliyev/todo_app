import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
  SharedStorage._();

  static SharedStorage instance = SharedStorage._();

  static SharedPreferences? _pref;

  static Future<void> prefInstance() async {
    _pref = await SharedPreferences.getInstance();
  }

  factory SharedStorage() => instance;

  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    await prefInstance();
    if (_pref != null) {
      _pref!.setString(key, value);
    }
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    await prefInstance();
    if (_pref != null) {
      _pref!.setBool(key, value);
    }
  }

  static Future<String> getString({
    required String key,
  }) async {
    await prefInstance();
    if (_pref != null) {
      return _pref!.getString(key) ?? '';
    }
    return '';
  }

  static Future<bool> getBool({
    required String key,
  }) async {
    await prefInstance();
    if (_pref != null) {
      return _pref!.getBool(key) ?? false;
    }
    return false;
  }
}
