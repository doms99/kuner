import 'package:kuner/device/models/settings.dart';

abstract class SettingsInteractor {
  Settings get settings;

  Future<bool> updateSettings(Settings value);
  void init();
}
