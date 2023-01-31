import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_screen_view_state.freezed.dart';

@freezed
class SettingsScreenViewState with _$SettingsScreenViewState {
  const SettingsScreenViewState._();

  const factory SettingsScreenViewState({
    required bool showDecimal,
  }) = _SettingsScreenViewState;
}
