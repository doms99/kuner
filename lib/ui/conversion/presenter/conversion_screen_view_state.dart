import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuner/device/model/conversion_state.dart';

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
  }) = _ConversionScreenViewState;

  factory ConversionScreenViewState.fromConversionState(ConversionState state, {required bool showDecimal}) {
    return ConversionScreenViewState(
      showDecimal: showDecimal,
      direction: state.conversionDirection,
      inputValue: state.inputValue,
      convertedValue: state.outputValue,
    );
  }

  WholeDecimalSeparated get input => _separate(inputValue);

  WholeDecimalSeparated get converted => _separate(convertedValue);

  ConversionState toConversionState() {
    return ConversionState(
      conversionDirection: direction,
      inputValue: inputValue,
      outputValue: convertedValue,
    );
  }

  WholeDecimalSeparated _separate(double value) {
    final whole = value.floor().toInt();
    final decimal = ((value - whole) * 100).round();

    return WholeDecimalSeparated(whole, decimal);
  }
}

class WholeDecimalSeparated {
  WholeDecimalSeparated(
    this.whole,
    this.decimal,
  );

  final int whole;
  final int decimal;
}
