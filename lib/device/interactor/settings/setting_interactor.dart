import 'package:kuner/device/model/settings.dart';

abstract class SettingsInteractor {
  Settings get settings;

  Future<void> updateSettings(Settings value);
  Future<void> init();
}
