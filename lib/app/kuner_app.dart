import 'package:flutter/material.dart';
import 'package:kuner/ui/common/theme/theme.dart';
import 'package:kuner/ui/conversion/conversion_screen.dart';

class KunerApp extends StatelessWidget {
  const KunerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuner',
      theme: KunerTheme.themeData,
      home: const ConversionScreen(),
    );
  }
}
