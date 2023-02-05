import 'dart:async';

import 'package:flutter/services.dart';
import 'package:kuner/app/constants.dart';
import 'package:rxdart/subjects.dart';

enum AmbientMode {
  enter,
  exit,
  update;
}

abstract class AmbientManager {
  bool get isAmbient;

  Stream<AmbientMode> get ambient;
}

class AmbientManagerImpl implements AmbientManager {
  AmbientManagerImpl() {
    _eventChannel.receiveBroadcastStream().listen((dynamic event) {
      if (event is! AmbientMode) return;

      _streamController.sink.add(event);
    });
  }

  final _streamController = BehaviorSubject<AmbientMode>();
  final _eventChannel = const EventChannel(Constants.ambientChannelId);

  @override
  Stream<AmbientMode> get ambient => _streamController.stream;

  @override
  bool get isAmbient => _streamController.hasValue ? _streamController.value != AmbientMode.exit : false;
}
