import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuner/common/util/speed_calculator.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/device/manager/rotary_manager.dart';

part 'conversion_rate_event.dart';
part 'conversion_rate_state.dart';
part 'conversion_rate_bloc.freezed.dart';

typedef ConversionScreenPresenterEmitter = Emitter<ConversionRateState>;
typedef State = ConversionRateState;
typedef Event = ConversionRateEvent;

class ConversionRateBloc extends Bloc<ConversionRateEvent, ConversionRateState> {
  ConversionRateBloc(
    this._conversionInteractor,
    RotaryManager rotaryManager,
  ) : super(ConversionRateState(
          conversionRate: _conversionInteractor.getSavedConversionRate(),
        )) {
    on<ConversionRateEvent>((event, emit) async {
      final completer = Completer<State>();

      event.when(
        updateValue: (value) => _onUpdateValue(value, completer),
      );

      emit(await completer.future);
    });
    _subscription = rotaryManager.onRotaryInput.listen(_rotaryListener);
  }

  late final StreamSubscription _subscription;

  final ConversionInteractor _conversionInteractor;

  void _rotaryListener(RotaryEvent event) {
    switch (event.direction) {
      case RotaryDirection.clockwise:
        add(ConversionRateEvent.updateValue(state.conversionRate + _getValueForSpeed(event.speed)));
        break;
      case RotaryDirection.counterclockwise:
        add(ConversionRateEvent.updateValue(
          max(0, state.conversionRate - _getValueForSpeed(event.speed)),
        ));
        break;
    }
  }

  double _getValueForSpeed(Speed speed) {
    switch (speed) {
      case Speed.slow:
        return 0.00001;
      case Speed.medium:
        return 0.0001;
      case Speed.fast:
        return 0.001;
      case Speed.veryFast:
        return 0.1;
    }
  }

  void _onUpdateValue(double value, Completer<State> completer) {
    _conversionInteractor.updateConversionRate(value);

    completer.complete(state.copyWith(conversionRate: value));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
