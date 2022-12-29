import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuner/ui/common/theme/theme.dart';
import 'package:kuner/ui/common/wear_os/wear_os_app.dart';
import 'package:kuner/ui/paged/paged_screen.dart';

class KunerApp extends StatelessWidget {
  const KunerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WearOsApp(
      title: 'Kuner',
      theme: KunerTheme.themeData,
      home: Builder(builder: (context) {
        final size = MediaQuery.of(context).size;

        return ScrollConfiguration(
          behavior: const CupertinoScrollBehavior(),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(size),
            child: const PagedScreen(),
          ),
        );
      }),
    );
  }
}
