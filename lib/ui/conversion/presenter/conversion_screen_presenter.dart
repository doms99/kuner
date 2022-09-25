import 'package:bloc/bloc.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_action.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_view_state.dart';

typedef ConversionScreenPresenterEmitter = Emitter<ConversionScreenViewState>;

class ConversionScreenPresenter extends Bloc<ConversionScreenAction, ConversionScreenViewState> {
  ConversionScreenPresenter(this._conversionInteractor) : super(ConversionScreenViewState.initial()) {
    on<ConversionScreenAction>((event, emit) {
      event.when(
        conversionTogglePressed: () => _onConversionTogglePressed(emit),
        newInputValue: (value) => _onNewInputValue(value, emit),
      );
    });
  }

  final ConversionInteractor _conversionInteractor;

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
      inputValue: state.convertedValue,
      convertedValue: _conversionInteractor.convert(state.convertedValue, direction: state.direction),
    ));
  }
}
