import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_screen_event.freezed.dart';

@freezed
abstract class ConversionScreenEvent with _$ConversionScreenEvent {
  const factory ConversionScreenEvent.conversionTogglePressed() = ConversionTogglePressed;
  const factory ConversionScreenEvent.newInputValue(double value) = NewInputValue;
  const factory ConversionScreenEvent.inputTap() = InputTap;
  const factory ConversionScreenEvent.reset() = Reset;
}
