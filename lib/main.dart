import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/app/kuner_app.dart';
import 'package:kuner/device/di/inject_dependency.dart' as device;
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';
import 'package:kuner/device/interactor/settings/setting_interactor.dart';

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
    GetIt.I.get<ConversionInteractor>().init(),
    GetIt.I.get<SettingsInteractor>().init(),
  ]);
}
