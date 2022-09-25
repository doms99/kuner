import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/app/kuner_app.dart';
import 'package:kuner/device/di/inject_dependency.dart' as device;
import 'package:kuner/device/interactor/conversion/conversion_interactor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  await initConversionRate();

  runApp(const KunerApp());
}

void injectDependencies() {
  device.injectDependency(GetIt.I);
}

Future<void> initConversionRate() async {
  final conversionInteractor = GetIt.I.get<ConversionInteractor>();

  await conversionInteractor.init();
}
