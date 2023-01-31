import 'package:freezed_annotation/freezed_annotation.dart';

part './settings.freezed.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    required bool showDecimal,
  }) = _Settings;

  factory Settings.initial() {
    return const Settings(showDecimal: true);
  }
}
