import 'package:kuner/app/constants.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/device/manager/shared_preferences.dart';
import 'package:kuner/device/model/conversion_rate_holder.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/components/models/conversion_direction.dart';

class ConversionInteractorImpl implements ConversionInteractor {
  ConversionInteractorImpl(
    this._conversionRateHolder,
    this._sharedPreferences,
  );

  final ConversionRateHolder _conversionRateHolder;
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    final savedConversionRate = await _sharedPreferences.getDouble(Constants.conversionRateKey);
    _conversionRateHolder.conversionRate = savedConversionRate ?? Constants.defaultConversionRate;
  }

  @override
  double convert(double value, {required ConversionDirection direction}) {
    switch (direction.input) {
      case Currency.eur:
        return value * _conversionRateHolder.conversionRate;
      case Currency.hrk:
        return value / _conversionRateHolder.conversionRate;
    }
  }

  @override
  Future<void> updateConversionRate(double newRate) async {
    final result = await _sharedPreferences.setDouble(Constants.conversionRateKey, newRate);
    if (result) {
      _conversionRateHolder.conversionRate = newRate;
    }
  }
}
