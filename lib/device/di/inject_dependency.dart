import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/device/cache/cache.dart';
import 'package:kuner/device/dio/create_dio.dart';
import 'package:kuner/device/interactors/conversion_interactor.dart';
import 'package:kuner/device/interactors/settings_interactor.dart';
import 'package:kuner/device/managers/ambient_manager.dart';
import 'package:kuner/device/managers/conversion_manager.dart';
import 'package:kuner/device/managers/rotary_manager.dart';
import 'package:kuner/device/managers/shape_manager.dart';
import 'package:kuner/device/managers/shared_preferences.dart';
import 'package:kuner/device/models/conversion_rate_holder.dart';
import 'package:kuner/device/models/settings/settings_holder.dart';
import 'package:kuner/device/services/exchange_service.dart';

void injectDependency(GetIt getIt) {
  getIt.registerLazySingleton<Dio>(() => createDio(getIt));
  getIt.registerLazySingleton<Cache>(() => SimpleCache(getIt.get()));
  getIt.registerLazySingleton<ExchangeService>(() => ExchangeServiceImpl(getIt.get()));

  getIt.registerLazySingleton<ShapeManager>(() => ShapeManagerImpl());
  getIt.registerLazySingleton<AmbientManager>(() => AmbientManagerImpl());
  getIt.registerLazySingleton<ConversionManager>(() => ConversionManagerImpl(getIt.get()));
  getIt.registerLazySingleton<RotaryManager>(() => RotaryManagerImpl());
  getIt.registerLazySingleton<SharedPreferences>(() => SharedPreferencesImpl());
  getIt.registerLazySingleton<ConversionRateHolder>(() => ConversionRateHolder());
  getIt.registerLazySingleton<SettingsHolder>(() => SettingsHolder());

  getIt.registerFactory<SettingsInteractor>(() => SettingsInteractorImpl(getIt.get(), getIt.get()));
  getIt.registerFactory<ConversionInteractor>(() => ConversionInteractorImpl(getIt.get(), getIt.get(), getIt.get()));
}
