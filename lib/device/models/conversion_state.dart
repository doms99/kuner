import 'package:kuner/ui/common/components/models/conversion_direction.dart';

class ConversionState {
  const ConversionState({
    required this.conversionDirection,
    required this.inputValue,
    required this.outputValue,
  });

  final ConversionDirection conversionDirection;
  final double inputValue;
  final double outputValue;
}
