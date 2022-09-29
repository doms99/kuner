import 'package:kuner/app/constants.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/device/manager/shared_preferences.dart';
import 'package:kuner/device/model/conversion_rate_holder.dart';
import 'package:kuner/device/model/conversion_state.dart';
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
    final savedConversionRate = await _sharedPreferences.getDouble(StorageConstants.conversionRateKey);
    _conversionRateHolder.conversionRate = savedConversionRate ?? StorageConstants.defaultConversionRate;
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
  Future<bool> updateConversionRate(double newRate) async {
    if (await _sharedPreferences.setDouble(StorageConstants.conversionRateKey, newRate)) {
      _conversionRateHolder.conversionRate = newRate;
      return true;
    }

    return false;
  }

  @override
  ConversionState getSavedState() {
    return ConversionState(
      conversionDirection: ConversionDirection.fromString(_sharedPreferences.getString(Constants.directionKey)) ??
          ConversionDirection.eur_hrk,
      inputValue: _sharedPreferences.getDouble(Constants.inputKey) ?? 0.0,
      outputValue: _sharedPreferences.getDouble(Constants.outputKey) ?? 0.0,
    );
  }

  @override
  Future<void> saveState(ConversionState state) async {
    await Future.wait([
      _sharedPreferences.setString(Constants.directionKey, state.conversionDirection.toString()),
      _sharedPreferences.setDouble(Constants.inputKey, state.inputValue),
      _sharedPreferences.setDouble(Constants.outputKey, state.outputValue)
    ]);
  }
}
