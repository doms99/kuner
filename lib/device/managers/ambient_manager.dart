import 'dart:async';

import 'package:flutter/services.dart';
import 'package:kuner/app/constants.dart';
import 'package:rxdart/subjects.dart';

abstract class AmbientManager {
  bool get currentAmbient;

  Stream<bool> get isAmbient;
}

class AmbientManagerImpl implements AmbientManager {
  AmbientManagerImpl() {
    _eventChannel.receiveBroadcastStream().listen((dynamic event) {
      if (event is! bool) return;

      _streamController.sink.add(event);
    });
  }

  final _streamController = BehaviorSubject<bool>();
  final _eventChannel = const EventChannel(Constants.ambientChannelId);

  @override
  Stream<bool> get isAmbient => _streamController.stream;

  @override
  bool get currentAmbient => _streamController.hasValue ? _streamController.value : false;
}
