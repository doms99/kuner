import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart' as sp;

abstract class SharedPreferences {
  Future<void> init();
  Future<bool> setString(String key, String value);
  String? getString(String key);
  Future<bool> setDouble(String key, double value);
  double? getDouble(String key);
  Future<bool> setBool(String key, bool value);
  bool? getBool(String key);
}

class SharedPreferencesImpl implements SharedPreferences {
  late sp.SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    _sharedPreferences = await sp.SharedPreferences.getInstance();
  }

  @override
  Future<bool> setString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _sharedPreferences.setDouble(key, value);
  }

  @override
  double? getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _sharedPreferences.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }
}
