import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/device/managers/ambient_manager.dart';
import 'package:kuner/ui/ambient_screen/ambient_screen.dart';
import 'package:kuner/ui/common/theme/theme.dart';
import 'package:kuner/ui/common/wear_os/wear_os_app.dart';
import 'package:kuner/ui/home/home_screen.dart';

class KunerApp extends StatelessWidget {
  const KunerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WearOsApp(
      title: 'Kuner',
      theme: KunerTheme.themeData,
      home: Builder(builder: (context) {
        return const ScrollConfiguration(
          behavior: CupertinoScrollBehavior(),
          child: _KunerApp(),
        );
      }),
    );
  }
}

class _KunerApp extends StatefulWidget {
  const _KunerApp({super.key});

  @override
  State<_KunerApp> createState() => _KunerAppState();
}

class _KunerAppState extends State<_KunerApp> {
  final ambientManager = GetIt.I.get<AmbientManager>();

  var _isAmbient = false;
  late final StreamSubscription<bool> subscription;

  @override
  void initState() {
    super.initState();
    subscription = ambientManager.isAmbient.listen((event) {
      setState(() {
        _isAmbient = event;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        const HomeScreen(),
        if (_isAmbient) const AmbientScreen(),
      ],
    );
  }
}
