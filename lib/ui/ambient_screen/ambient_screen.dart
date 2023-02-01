import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kuner/ui/common/clock/clock_widget.dart';

class AmbientScreen extends StatelessWidget {
  const AmbientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ClockWidget(large: true),
      ),
    );
  }
}
