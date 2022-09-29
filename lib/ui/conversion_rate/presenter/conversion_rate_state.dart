part of 'conversion_rate_bloc.dart';

@freezed
class ConversionRateState with _$ConversionRateState {
  const ConversionRateState._();

  const factory ConversionRateState({
    required double conversionRate,
  }) = _ConversionRateState;
}
