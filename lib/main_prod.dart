import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/app/run_kuner_app.dart';
import 'package:kuner/common/flavors/flavor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton<Flavor>(Flavor.prod);

  runKunerApp();
}
