import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kuner/ui/common/components/models/conversion_direction.dart';

part 'conversion_screen_view_state.freezed.dart';

@freezed
class ConversionScreenViewState with _$ConversionScreenViewState {
  const ConversionScreenViewState._();

  const factory ConversionScreenViewState({
    required ConversionDirection direction,
    required double inputValue,
    required double convertedValue,
  }) = _ConversionScreenViewState;

  factory ConversionScreenViewState.initial() {
    return const ConversionScreenViewState(
      direction: ConversionDirection.hrk_eur,
      inputValue: 0,
      convertedValue: 0,
    );
  }

  WholeDecimalSeparated get input => _separate(inputValue);

  WholeDecimalSeparated get converted => _separate(convertedValue);

  WholeDecimalSeparated _separate(double value) {
    final whole = value.floor().toInt();
    final decimal = ((value - whole) * 100).ceil().toInt();

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
