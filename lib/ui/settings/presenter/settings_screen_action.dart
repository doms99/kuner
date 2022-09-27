import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_screen_action.freezed.dart';

@freezed
class SettingsScreenAction with _$SettingsScreenAction {
  const factory SettingsScreenAction.toggle() = Toggle;
}
