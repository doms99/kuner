import 'package:get_it/get_it.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor_impl.dart';
import 'package:kuner/device/interactor/settings/setting_interactor.dart';
import 'package:kuner/device/interactor/settings/settings_interactor_impl.dart';
import 'package:kuner/device/manager/rotary_manager.dart';
import 'package:kuner/device/manager/shared_preferences.dart';
import 'package:kuner/device/models/conversion_rate_holder.dart';
import 'package:kuner/device/models/settings_holder.dart';

void injectDependency(GetIt getIt) {
  getIt.registerLazySingleton<RotaryManager>(
    () => RotaryManager(),
  );

  getIt.registerLazySingleton<SharedPreferences>(
    () => SharedPreferences(),
  );

  getIt.registerLazySingleton<ConversionRateHolder>(
    () => ConversionRateHolder(),
  );

  getIt.registerLazySingleton<SettingsHolder>(
    () => SettingsHolder(),
  );

  getIt.registerFactory<SettingsInteractor>(
    () => SettingsInteractorImpl(
      getIt.get(),
      getIt.get(),
    ),
  );

  getIt.registerFactory<ConversionInteractor>(
    () => ConversionInteractorImpl(
      getIt.get(),
      getIt.get(),
    ),
  );
}
