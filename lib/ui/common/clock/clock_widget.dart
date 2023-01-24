import 'dart:async';

import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late DateTime time;
  late final Timer timer;

  String get _time => '${time.hour}:${time.minute}';

  @override
  void initState() {
    super.initState();

    time = DateTime.now();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _setTime(),
    );
  }

  void _setTime() {
    if (!mounted) {
      return;
    }

    setState(() {
      time = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_time);
  }
}
