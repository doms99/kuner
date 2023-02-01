import 'package:flutter/services.dart';
import 'package:kuner/app/constants.dart';

enum Shape {
  circle,
  rectangle;

  static Shape fromString(String value) {
    switch (value) {
      case 'circle':
        return circle;
      case 'rectangle':
        return rectangle;
      default:
        throw Exception('Unknown shape: $value');
    }
  }
}

abstract class ShapeManager {
  Future<void> init();

  Shape get deviceShape;
}

class ShapeManagerImpl implements ShapeManager {
  final _methodChannel = const MethodChannel(Constants.methodChannelId);

  late final Shape _shape;
  @override
  Shape get deviceShape => _shape;

  @override
  Future<void> init() async {
    final shapeString = await _methodChannel.invokeMethod<String>('getDeviceShape');
    if (shapeString == null) {
      throw Exception('Shape is null');
    }

    _shape = Shape.fromString(shapeString);
  }
}
