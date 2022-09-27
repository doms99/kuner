import 'package:shared_preferences_android/shared_preferences_android.dart';

class SharedPreferences {
  SharedPreferences() {
    _sharedPreferences = SharedPreferencesAndroid();
  }

  late SharedPreferencesAndroid _sharedPreferences;

  Future<T?> _getValue<T>(String key) async {
    final mapOfAll = await _sharedPreferences.getAll();
    final potentialValue = mapOfAll[key];

    return potentialValue is T? ? potentialValue : null;
  }

  Future<bool> setString(String key, String value) {
    return _sharedPreferences.setValue('String', key, value);
  }

  Future<String?> getString(String key) {
    return _getValue<String>(key);
  }

  Future<bool> setDouble(String key, double value) {
    return _sharedPreferences.setValue('Double', key, value);
  }

  Future<double?> getDouble(String key) async {
    return _getValue<double>(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _sharedPreferences.setValue('Bool', key, value);
  }

  Future<bool?> getBool(String key) async {
    return _getValue<bool>(key);
  }
}
