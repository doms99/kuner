import 'package:kuner/device/model/settings.dart';

abstract class SettingInteractor {
  Settings get settings;

  Future<void> updateSettings(Settings value);
}
