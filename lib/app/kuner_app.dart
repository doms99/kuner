import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/app/device_shape.dart';
import 'package:kuner/device/managers/ambient_manager.dart';
import 'package:kuner/device/managers/shape_manager.dart';
import 'package:kuner/ui/ambient_screen/ambient_screen.dart';
import 'package:kuner/ui/common/theme/theme.dart';
import 'package:kuner/ui/common/wear_os/ambient_builder.dart';
import 'package:kuner/ui/common/wear_os/wear_os_app.dart';
import 'package:kuner/ui/home/home_screen.dart';

class KunerApp extends StatelessWidget {
  const KunerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WearOsApp(
      title: 'Kuner',
      theme: KunerTheme.themeData,
      builder: (context, child) {
        return DeviceShape(
          shape: GetIt.I.get<ShapeManager>().deviceShape,
          child: child!,
        );
      },
      home: const AmbientBuilder(
        ambientChild: AmbientScreen(),
        child: ScrollConfiguration(
          behavior: CupertinoScrollBehavior(),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
