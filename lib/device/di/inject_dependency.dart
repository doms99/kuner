import 'package:get_it/get_it.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/device/interactor/conversion/conversion_interactor_impl.dart';
import 'package:kuner/device/manager/rotary_manager.dart';
import 'package:kuner/device/manager/shared_preferences.dart';
import 'package:kuner/device/model/conversion_rate_holder.dart';

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

  getIt.registerFactory<ConversionInteractor>(
    () => ConversionInteractorImpl(
      getIt.get(),
      getIt.get(),
    ),
  );
}
