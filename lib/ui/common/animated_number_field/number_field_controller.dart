import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewValueProps {
  final double value;
  final bool animated;

  NewValueProps(this.value, this.animated);
}

class NumberFieldController extends ValueNotifier<NewValueProps> {
  NumberFieldController({double initialValue = 0}) : super(NewValueProps(0, false));

  void setValue(double value, {bool animated = true}) {
    super.value = NewValueProps(value, animated);
  }

  void reset() {
    super.value = NewValueProps(0, true);
  }
}
