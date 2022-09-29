import 'package:kuner/ui/common/components/models/conversion_direction.dart';

abstract class ConversionInteractor {
  Future<void> init();
  double convert(double value, {required ConversionDirection direction});
  Future<bool> updateConversionRate(double newRate);
}
