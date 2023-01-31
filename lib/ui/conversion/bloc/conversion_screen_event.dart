part of 'conversion_screen_bloc.dart';

@freezed
abstract class ConversionScreenEvent with _$ConversionScreenEvent {
  const factory ConversionScreenEvent.conversionTogglePressed() = ConversionTogglePressed;
  const factory ConversionScreenEvent.newInputValue(double value) = NewInputValue;
  const factory ConversionScreenEvent.inputTap() = InputTap;
  const factory ConversionScreenEvent.reset() = Reset;
  const factory ConversionScreenEvent.enableRotary() = EnableRotary;
  const factory ConversionScreenEvent.disableRotary() = DisableRotary;
}
