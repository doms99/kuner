
import 'package:kuner/device/managers/shared_preferences.dart';

abstract class Cache {
  Future<void> delete(String key);
  Future<bool> exists(String key);
  Future<String?> get(String key);
  Future<void> put(String key, String value);
}

class SimpleCache implements Cache {
  final SharedPreferences _preferences;

  SimpleCache(this._preferences);

  @override
  Future<void> delete(String key) async {
    _preferences.remove(key);
  }

  @override
  Future<bool> exists(String key) async {
    return _preferences.getString(key) != null;
  }

  @override
  Future<String?> get(String key) async {
    return _preferences.getString(key);
  }

  @override
  Future<void> put(String key, String value) async {
    _preferences.setString(key, value);
  }
}
