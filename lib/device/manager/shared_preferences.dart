import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart' as sp;

class SharedPreferences {
  late sp.SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await sp.SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  Future<bool> setDouble(String key, double value) {
    return _sharedPreferences.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _sharedPreferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }
}
