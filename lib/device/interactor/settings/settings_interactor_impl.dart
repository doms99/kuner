import 'package:kuner/app/constants.dart';
import 'package:kuner/device/interactor/settings/setting_interactor.dart';
import 'package:kuner/device/manager/shared_preferences.dart';
import 'package:kuner/device/model/settings.dart';
import 'package:kuner/device/model/settings_holder.dart';

class SettingsInteractorImpl implements SettingsInteractor {
  SettingsInteractorImpl(this._settingsHolder, this._sharedPreferences);

  final SettingsHolder _settingsHolder;
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    final showDecimal = await _sharedPreferences.getBool(StorageConstants.settingsDecimalKey);
    _settingsHolder.settings = Settings(showDecimal: showDecimal ?? StorageConstants.defaultSettingsDecimal);
  }

  @override
  Settings get settings => _settingsHolder.settings;

  @override
  Future<void> updateSettings(Settings value) async {
    await _sharedPreferences.setBool(StorageConstants.settingsDecimalKey, value.showDecimal);
    _settingsHolder.settings = value;
  }
}
