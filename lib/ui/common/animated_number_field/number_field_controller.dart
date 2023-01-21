import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewValueProps {
  final double previous;
  final double value;
  final bool animated;

  NewValueProps(this.value, this.previous, this.animated);
}

class NumberFieldController extends ValueNotifier<NewValueProps> {
  NumberFieldController({double initialValue = 0}) : super(NewValueProps(initialValue, initialValue, false));

  NewValueProps get state => value;

  void setValue(double value, {bool animated = true}) {
    super.value = NewValueProps(value, state.value, animated);
  }

  void reset() {
    super.value = NewValueProps(0, state.value, true);
  }
}
