import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kuner/device/interactors/settings_interactor.dart';
import 'package:kuner/ui/settings/presenter/settings_screen_action.dart';
import 'package:kuner/ui/settings/presenter/settings_screen_view_state.dart';

typedef SettingsEmitter = Emitter<SettingsScreenViewState>;

class SettingsScreenPresenter extends Bloc<SettingsScreenAction, SettingsScreenViewState> {
  SettingsScreenPresenter(
    this._settingInteractor,
  ) : super(SettingsScreenViewState(showDecimal: _settingInteractor.settings.showDecimal)) {
    on<SettingsScreenAction>(
      (event, emit) async {
        final completer = Completer<void>();

        event.when(toggle: () async {
          await _onToggle(emit);
          completer.complete();
        });

        await completer.future;
      },
    );
  }

  final SettingsInteractor _settingInteractor;

  Future<void> _onToggle(SettingsEmitter emit) async {
    await _settingInteractor.updateSettings(
      _settingInteractor.settings.copyWith(showDecimal: !state.showDecimal),
    );

    emit(state.copyWith(showDecimal: !state.showDecimal));
  }
}
