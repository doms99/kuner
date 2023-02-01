import 'package:flutter/material.dart';
import 'package:kuner/device/managers/shape_manager.dart';

abstract class DeviceShapeState {
  Shape get shape;
}

class DeviceShape extends InheritedWidget implements DeviceShapeState {
  const DeviceShape({
    super.key,
    required Widget child,
    required this.shape,
  }) : super(child: child);

  @override
  final Shape shape;

  static DeviceShapeState of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<DeviceShape>();
    if (widget == null) {
      throw FlutterError('No DeviceShape found in context');
    }

    return widget;
  }

  @override
  bool updateShouldNotify(DeviceShape oldWidget) {
    return true;
  }
}
