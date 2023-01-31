import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_screen_event.freezed.dart';

@freezed
class SettingsScreenEvent with _$SettingsScreenEvent {
  const factory SettingsScreenEvent.toggle() = Toggle;
}
