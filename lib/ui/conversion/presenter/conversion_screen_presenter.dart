import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:kuner/common/debouncer.dart';
import 'package:kuner/common/util/speed_calculator.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/device/manager/rotary_manager.dart';
import 'package:kuner/device/model/conversion_state.dart';
import 'package:kuner/device/model/settings_holder.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_action.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_view_state.dart';

typedef ConversionScreenPresenterEmitter = Emitter<ConversionScreenViewState>;
typedef State = ConversionScreenViewState;
typedef Event = ConversionScreenAction;

class ConversionScreenPresenter extends Bloc<Event, State> {
  ConversionScreenPresenter(
    this._conversionInteractor,
    SettingsHolder settingsHolder,
    RotaryManager rotaryManager,
  ) : super(_initialState(_conversionInteractor, settingsHolder)) {
    on<ConversionScreenAction>((event, emit) async {
      final completer = Completer<State>();

      event.when(
        conversionTogglePressed: () => _onConversionTogglePressed(completer),
        newInputValue: (value) => _onNewInputValue(value, completer),
        inputTap: () => _onNewInputValue(state.inputValue + 0.1, completer),
      );

      emit(await completer.future);
    });
    _subscription = rotaryManager.onRotaryInput.listen(_rotaryListener);
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
        add(ConversionScreenAction.newInputValue(state.inputValue + _getValueForSpeed(event.speed)));
        break;
      case RotaryDirection.counterclockwise:
        add(ConversionScreenAction.newInputValue(
          max(0, state.inputValue - _getValueForSpeed(event.speed)),
        ));
        break;
    }
  }

  double _getValueForSpeed(Speed speed) {
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

  void _onConversionTogglePressed(Completer<State> completer) {
    final flipDirection = state.direction.other;

    final newState = state.copyWith(
      direction: flipDirection,
      inputValue: state.convertedValue.roundToDouble(),
      convertedValue: _conversionInteractor.convert(state.convertedValue.roundToDouble(), direction: flipDirection),
    );

    _saveToSharedPrefs(newState.toConversionState());

    completer.complete(newState);
  }

  void _onNewInputValue(double value, Completer<State> completer) {
    final newState = state.copyWith(
      inputValue: value,
      convertedValue: _conversionInteractor.convert(value, direction: state.direction),
    );

    _saveToSharedPrefs(newState.toConversionState());

    completer.complete(newState);
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
