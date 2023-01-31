import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kuner/device/interactors/settings_interactor.dart';
import 'package:kuner/ui/settings/presenter/settings_screen_event.dart';
import 'package:kuner/ui/settings/presenter/settings_screen_view_state.dart';

typedef SettingsEmitter = Emitter<SettingsScreenViewState>;
typedef State = SettingsScreenViewState;
typedef Event = SettingsScreenEvent;

class SettingsScreenBloc extends Bloc<Event, State> {
  SettingsScreenBloc(
    this._settingInteractor,
  ) : super(State(showDecimal: _settingInteractor.settings.showDecimal)) {
    on<SettingsScreenEvent>(
      (event, emit) async {
        FutureOr<State> newState = event.when(
          toggle: () => _onToggle(),
        );

        emit(await newState);
      },
    );
  }

  final SettingsInteractor _settingInteractor;

  Future<State> _onToggle() async {
    await _settingInteractor.updateSettings(
      _settingInteractor.settings.copyWith(showDecimal: !state.showDecimal),
    );

    return state.copyWith(showDecimal: !state.showDecimal);
  }
}
