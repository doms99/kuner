import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/device/managers/ambient_manager.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';

class AmbientClockWidget extends StatefulWidget {
  const AmbientClockWidget({super.key});

  @override
  State createState() => _AmbientClockWidgetState();
}

class _AmbientClockWidgetState extends State<AmbientClockWidget> {
  late DateTime time;
  final AmbientManager _manager = GetIt.I.get<AmbientManager>();
  late StreamSubscription _subscription;

  String get _time => '${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}';

  @override
  void initState() {
    super.initState();

    time = DateTime.now();
    _subscription = _manager.ambient.where(_shouldUpdate).listen((_) => _setTime());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  bool _shouldUpdate(AmbientMode mode) {
    return mode == AmbientMode.update || mode == AmbientMode.enter;
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
      style: Theme.of(context).numberTheme.displayLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }
}
