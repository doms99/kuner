import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuner/common/debouncer.dart';
import 'package:kuner/common/util/speed_calculator.dart';
import 'package:kuner/device/interactors/conversion_interactor.dart';
import 'package:kuner/device/managers/rotary_manager.dart';
import 'package:kuner/device/models/conversion_state.dart';
import 'package:kuner/device/models/settings_holder.dart';
import 'package:kuner/ui/common/components/models/conversion_direction.dart';

part 'conversion_screen_event.dart';
part 'conversion_screen_state.dart';
part 'conversion_screen_bloc.freezed.dart';

typedef State = ConversionScreenState;
typedef Event = ConversionScreenEvent;

class ConversionScreenBloc extends Bloc<Event, State> {
  ConversionScreenBloc(
    this._conversionInteractor,
    SettingsHolder settingsHolder,
    RotaryManager rotaryManager,
  ) : super(_initialState(_conversionInteractor, settingsHolder)) {
    _subscription = rotaryManager.onRotaryInput.listen(_rotaryListener);
    on<ConversionScreenEvent>((event, emit) async {
      FutureOr<State> newState = event.when(
        conversionTogglePressed: () => _onConversionTogglePressed(),
        newInputValue: (value) => _onNewInputValue(value),
        inputTap: () => _onInputValueTap(),
        reset: () => _onReset(),
        disableRotary: () => _onListenerToggle(false),
        enableRotary: () => _onListenerToggle(true),
      );

      emit(await newState);
    });
  }

  final ConversionInteractor _conversionInteractor;
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 500));

  late final StreamSubscription _subscription;

  static State _initialState(ConversionInteractor interactor, SettingsHolder holder) {
    return State.fromConversionState(
      interactor.getSavedState(),
      showDecimal: holder.settings.showDecimal,
    );
  }

  void _rotaryListener(RotaryEvent event) {
    switch (event.direction) {
      case RotaryDirection.clockwise:
        add(ConversionScreenEvent.newInputValue(state.inputValue + _getValueForSpeed(event.speed)));
        break;
      case RotaryDirection.counterclockwise:
        add(ConversionScreenEvent.newInputValue(
          max(0, state.inputValue - _getValueForSpeed(event.speed)),
        ));
        break;
    }
  }

  double _getValueForSpeed(Speed speed) {
    switch (speed) {
      case Speed.slow:
        return 1;
      case Speed.fast:
        return 10;
      case Speed.ludicrous:
        return 100;
    }
  }

  State _onConversionTogglePressed() {
    final flipDirection = state.direction.other;

    final newState = state.copyWith(
      direction: flipDirection,
      inputValue: state.convertedValue.roundToDouble(),
      convertedValue: _conversionInteractor.convert(state.convertedValue.roundToDouble(), direction: flipDirection),
      animate: true,
    );

    _saveToSharedPrefs(newState.toConversionState());

    return newState;
  }

  State _onNewInputValue(double value) {
    final newState = state.copyWith(
      inputValue: value,
      convertedValue: _conversionInteractor.convert(value, direction: state.direction),
      animate: false,
    );

    _saveToSharedPrefs(newState.toConversionState());

    return newState;
  }

  State _onInputValueTap() {
    final newState = state.copyWith(
      inputValue: state.inputValue + 0.1,
      convertedValue: _conversionInteractor.convert(state.inputValue + 0.1, direction: state.direction),
      animate: true,
    );

    _saveToSharedPrefs(newState.toConversionState());

    return newState;
  }

  State _onReset() {
    final newState = state.copyWith(
      inputValue: 0,
      convertedValue: 0,
      animate: true,
    );

    _saveToSharedPrefs(newState.toConversionState());

    return newState;
  }

  State _onListenerToggle(bool enabled) {
    if (enabled) {
      _subscription.resume();
    } else {
      _subscription.pause();
    }

    return state.copyWith(rotaryEnabled: enabled);
  }

  void _saveToSharedPrefs(ConversionState state) {
    _debouncer.run(() => _conversionInteractor.saveState(state));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }
}
