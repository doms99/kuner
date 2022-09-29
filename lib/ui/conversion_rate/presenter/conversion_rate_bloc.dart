import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';

part 'conversion_rate_event.dart';
part 'conversion_rate_state.dart';
part 'conversion_rate_bloc.freezed.dart';

typedef ConversionScreenPresenterEmitter = Emitter<ConversionRateState>;
typedef State = ConversionRateState;
typedef Event = ConversionRateEvent;

class ConversionRateBloc extends Bloc<ConversionRateEvent, ConversionRateState> {
  ConversionRateBloc(this._conversionInteractor)
      : super(ConversionRateState(
          conversionRate: _conversionInteractor.getSavedConversionRate(),
        )) {
    on<ConversionRateEvent>((event, emit) async {
      final completer = Completer<State>();

      event.when(
        updateValue: (value) => _onUpdateValue(value, completer),
      );

      emit(await completer.future);
    });
  }

  final ConversionInteractor _conversionInteractor;

  void _onUpdateValue(double value, Completer<State> completer) {
    _conversionInteractor.updateConversionRate(value);

    completer.complete(state.copyWith(conversionRate: value));
  }
}
