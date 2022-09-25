import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:kuner/common/util/speed_calculator.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/device/manager/rotary_manager.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_action.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_view_state.dart';

typedef ConversionScreenPresenterEmitter = Emitter<ConversionScreenViewState>;

class ConversionScreenPresenter extends Bloc<ConversionScreenAction, ConversionScreenViewState> {
  ConversionScreenPresenter(
    this._conversionInteractor,
    RotaryManager rotaryManager,
  ) : super(ConversionScreenViewState.initial()) {
    on<ConversionScreenAction>((event, emit) {
      event.when(
        conversionTogglePressed: () => _onConversionTogglePressed(emit),
        newInputValue: (value) => _onNewInputValue(value, emit),
      );
    });
    _subscription = rotaryManager.onRotaryInput.listen(_rotaryListener);
  }

  final ConversionInteractor _conversionInteractor;
  late final StreamSubscription _subscription;

  void _rotaryListener(RotaryEvent event) {
    switch (event.direction) {
      case RotaryDirection.clockwise:
        add(ConversionScreenAction.newInputValue(state.inputValue + _getValue(event.speed)));
        break;
      case RotaryDirection.counterclockwise:
        add(ConversionScreenAction.newInputValue(max(0, state.inputValue - _getValue(event.speed))));
        break;
    }
  }

  double _getValue(Speed speed) {
    switch (speed) {
      case Speed.slow:
        return 1;
      case Speed.medium:
        return 5;
      case Speed.fast:
        return 10;
      case Speed.veryFast:
        return 100;
    }
  }

  void _onConversionTogglePressed(ConversionScreenPresenterEmitter emit) {
    final flipDirection = state.direction.other;

    emit(ConversionScreenViewState(
      direction: flipDirection,
      inputValue: state.convertedValue,
      convertedValue: _conversionInteractor.convert(state.convertedValue, direction: flipDirection),
    ));
  }

  void _onNewInputValue(double value, ConversionScreenPresenterEmitter emit) {
    emit(state.copyWith(
      inputValue: value,
      convertedValue: _conversionInteractor.convert(value, direction: state.direction),
    ));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }
}
