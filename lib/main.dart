import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/app/kuner_app.dart';
import 'package:kuner/device/di/inject_dependency.dart' as device;
import 'package:kuner/device/interactors/conversion_interactor.dart';
import 'package:kuner/device/interactors/settings_interactor.dart';
import 'package:kuner/device/managers/shape_manager.dart';
import 'package:kuner/device/managers/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();

  await initState();

  runApp(const KunerApp());
}

void injectDependencies() {
  device.injectDependency(GetIt.I);
}

Future<void> initState() async {
  await Future.wait([
    GetIt.I.get<SharedPreferences>().init(),
    GetIt.I.get<ShapeManager>().init(),
  ]);

  GetIt.I.get<ConversionInteractor>().init();
  GetIt.I.get<SettingsInteractor>().init();
}
