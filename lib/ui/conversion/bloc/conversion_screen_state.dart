part of 'conversion_screen_bloc.dart';

@freezed
class ConversionScreenState with _$ConversionScreenState {
  const ConversionScreenState._();

  const factory ConversionScreenState({
    required bool showDecimal,
    required ConversionDirection direction,
    required double inputValue,
    required double convertedValue,
    required bool animate,
    required bool rotaryEnabled,
  }) = _ConversionScreenViewState;

  factory ConversionScreenState.fromConversionState(ConversionState state, {required bool showDecimal}) {
    return ConversionScreenState(
      rotaryEnabled: true,
      showDecimal: showDecimal,
      direction: state.conversionDirection,
      inputValue: state.inputValue,
      convertedValue: state.outputValue,
      animate: false,
    );
  }

  ConversionState toConversionState() {
    return ConversionState(
      conversionDirection: direction,
      inputValue: inputValue,
      outputValue: convertedValue,
    );
  }
}
