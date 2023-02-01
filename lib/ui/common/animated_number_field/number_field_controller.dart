import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewValueProps {
  final double previous;
  final double value;
  final bool animated;

  NewValueProps(this.value, this.previous, this.animated);
}

class NumberFieldController extends ChangeNotifier {
  NumberFieldController({double initialValue = 0}) : _state = NewValueProps(initialValue, initialValue, false);

  NewValueProps _state;
  NewValueProps get state => _state;

  void setValue(double value, {bool animated = true}) {
    _state = NewValueProps(value, state.value, animated);
    notifyListeners();
  }

  void reset() {
    _state = NewValueProps(0, state.value, true);
    notifyListeners();
  }
}
