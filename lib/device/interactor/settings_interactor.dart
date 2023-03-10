import 'package:kuner/app/constants.dart';
import 'package:kuner/device/managers/shared_preferences.dart';
import 'package:kuner/device/models/settings.dart';
import 'package:kuner/device/models/settings_holder.dart';

abstract class SettingsInteractor {
  Settings get settings;

  Future<bool> updateSettings(Settings value);
  void init();
}

class SettingsInteractorImpl implements SettingsInteractor {
  SettingsInteractorImpl(this._settingsHolder, this._sharedPreferences);

  final SettingsHolder _settingsHolder;
  final SharedPreferences _sharedPreferences;

  @override
  void init() {
    final showDecimal = _sharedPreferences.getBool(StorageConstants.settingsDecimalKey);
    _settingsHolder.settings = Settings(showDecimal: showDecimal ?? Constants.defaultSettingsDecimal);
  }

  @override
  Settings get settings => _settingsHolder.settings;

  @override
  Future<bool> updateSettings(Settings value) async {
    if (await _sharedPreferences.setBool(StorageConstants.settingsDecimalKey, value.showDecimal)) {
      _settingsHolder.settings = value;
      return true;
    }

    return false;
  }
}
