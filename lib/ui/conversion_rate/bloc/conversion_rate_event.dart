part of 'conversion_rate_bloc.dart';

@freezed
class ConversionRateEvent with _$ConversionRateEvent {
  const factory ConversionRateEvent.updateValue(double value) = UpdateValue;
  const factory ConversionRateEvent.reset() = ResetValue;
}
