import 'dart:async';

import 'package:flutter/services.dart';

import 'package:kuner/app/Constants.dart';
import 'package:kuner/common/util/speed_calculator.dart';

enum RotaryDirection {
  clockwise,
  counterclockwise,
}

abstract class RotaryManager {
  Stream<RotaryEvent> get onRotaryInput;
}

class RotaryManagerImpl implements RotaryManager {
  RotaryManagerImpl() {
    _eventChannel.receiveBroadcastStream({'vibrate': true}).listen((dynamic event) {
      if (event is! double) return;

      if (last != null && event.isNegative != last?.isNegative) {
        _speedCalculator.reset();
      }

      if (event < 0) {
        _streamController.sink.add(
          RotaryEvent(
            direction: RotaryDirection.counterclockwise,
            speed: _speedCalculator.click(multiplier: event.abs()),
          ),
        );
      } else {
        _streamController.sink.add(
          RotaryEvent(
            direction: RotaryDirection.clockwise,
            speed: _speedCalculator.click(multiplier: event.abs()),
          ),
        );
      }
    });
  }

  double? last;
  final _eventChannel = const EventChannel(Constants.rotaryChannelId);
  final _speedCalculator = SpeedCalculator();
  final _streamController = StreamController<RotaryEvent>.broadcast();

  @override
  Stream<RotaryEvent> get onRotaryInput => _streamController.stream;
}

class RotaryEvent {
  RotaryEvent({
    required this.direction,
    required this.speed,
  });

  final RotaryDirection direction;
  final Speed speed;
}
