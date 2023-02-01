import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({
    this.large = false,
    super.key,
  });

  final bool large;

  @override
  State createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late DateTime time;
  late final Timer timer;

  String get _time => '${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}';

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
    return Text(
      _time,
      style: widget.large
          ? Theme.of(context).numberTheme.displayLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )
          : null,
    );
  }
}
