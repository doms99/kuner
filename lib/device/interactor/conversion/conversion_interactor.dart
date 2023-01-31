import 'package:kuner/device/models/conversion_state.dart';
import 'package:kuner/ui/common/components/models/conversion_direction.dart';

abstract class ConversionInteractor {
  void init();

  double convert(double value, {required ConversionDirection direction});

  Future<bool> updateConversionRate(double newRate);
  double getSavedConversionRate();

  ConversionState getSavedState();
  Future<void> saveState(ConversionState state);
}
