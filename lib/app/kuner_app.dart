import 'package:flutter/cupertino.dart';
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
          child: HomeScreen(),
        );
      }),
    );
  }
}
