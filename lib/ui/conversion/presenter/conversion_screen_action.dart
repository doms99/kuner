import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_screen_action.freezed.dart';

@freezed
class ConversionScreenAction with _$ConversionScreenAction {
  const factory ConversionScreenAction.conversionTogglePressed() = ConversionTogglePressed;
  const factory ConversionScreenAction.newInputValue(double value) = NewInputValue;
}
