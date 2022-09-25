import 'dart:async';

import 'package:bloc/bloc.dart';
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

  void _rotaryListener(RotaryDirection direction) {
    switch (direction) {
      case RotaryDirection.clockwise:
        add(ConversionScreenAction.newInputValue(state.inputValue + 1));
        break;
      case RotaryDirection.counterclockwise:
        add(ConversionScreenAction.newInputValue(state.inputValue - 1));
        break;
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
