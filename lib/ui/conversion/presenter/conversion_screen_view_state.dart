import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuner/device/models/conversion_state.dart';

import 'package:kuner/ui/common/components/models/conversion_direction.dart';

part 'conversion_screen_view_state.freezed.dart';

@freezed
class ConversionScreenViewState with _$ConversionScreenViewState {
  const ConversionScreenViewState._();

  const factory ConversionScreenViewState({
    required bool showDecimal,
    required ConversionDirection direction,
    required double inputValue,
    required double convertedValue,
    required bool animate,
  }) = _ConversionScreenViewState;

  factory ConversionScreenViewState.fromConversionState(ConversionState state, {required bool showDecimal}) {
    return ConversionScreenViewState(
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
