import 'dart:async';

import 'package:flutter/services.dart';
import 'package:kuner/app/Constants.dart';

enum RotaryDirection {
  clockwise,
  counterclockwise,
}

class RotaryManager {
  final _eventChannel = const EventChannel(Constants.rotaryChannelId);

  RotaryManager() {
    _eventChannel.receiveBroadcastStream({'vibrate': true}).listen((dynamic event) {
      if (event is! double) return;

      if (event < 0) {
        _streamController.sink.add(RotaryDirection.clockwise);
      } else {
        _streamController.sink.add(RotaryDirection.counterclockwise);
      }
    });
  }

  final _streamController = StreamController<RotaryDirection>.broadcast();

  Stream<RotaryDirection> get onRotaryInput => _streamController.stream;
}
