import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/device/managers/ambient_manager.dart';
import 'package:kuner/ui/ambient_screen/ambient_screen.dart';
import 'package:kuner/ui/common/theme/theme.dart';
import 'package:kuner/ui/common/wear_os/wear_os_app.dart';
import 'package:kuner/ui/home/home_screen.dart';

class KunerApp extends StatefulWidget {
  const KunerApp({super.key});

  @override
  State<KunerApp> createState() => _KunerAppState();
}

class _KunerAppState extends State<KunerApp> {
  final ambientManager = GetIt.I.get<AmbientManager>();

  var _isAmbient = false;
  late final StreamSubscription<bool> subscription;

  @override
  void initState() {
    super.initState();
    subscription = ambientManager.isAmbient.listen((event) {
      print(event);
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
    return WearOsApp(
      title: 'Kuner',
      theme: KunerTheme.themeData,
      home: Builder(builder: (context) {
        return ScrollConfiguration(
          behavior: const CupertinoScrollBehavior(),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              const HomeScreen(),
              if (_isAmbient) const AmbientScreen(),
            ],
          ),
        );
      }),
    );
  }
}
