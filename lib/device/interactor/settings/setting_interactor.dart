import 'package:kuner/device/model/settings.dart';

abstract class SettingsInteractor {
  Settings get settings;

  Future<bool> updateSettings(Settings value);
  Future<void> init();
}
