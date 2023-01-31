import 'package:kuner/device/models/conversion_rate_holder.dart';
import 'package:kuner/ui/common/components/models/conversion_direction.dart';
import 'package:kuner/ui/common/components/models/currency.dart';

abstract class ConversionManager {
  double convert(double value, {required ConversionDirection direction});
}

class ConversionManagerImpl implements ConversionManager {
  ConversionManagerImpl(this._conversionRateHolder);

  final ConversionRateHolder _conversionRateHolder;

  @override
  double convert(double value, {required ConversionDirection direction}) {
    switch (direction.input) {
      case Currency.eur:
        return value * _conversionRateHolder.conversionRate;
      case Currency.hrk:
        return value / _conversionRateHolder.conversionRate;
    }
  }
}
