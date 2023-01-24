import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kuner/ui/common/animated_number_field/number_field_controller.dart';

NumberFieldController useNumberField({double initialValue = 0}) {
  useAnimationController(duration: const Duration(milliseconds: 250));
  final controller = useMemoized(() => NumberFieldController(initialValue: initialValue));
  return controller;
}
