import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kuner/common/util/separate_double.dart';
import 'package:kuner/ui/common/animated_number_field/number_field_controller.dart';

class AnimatedNumberField extends StatefulWidget {
  const AnimatedNumberField({
    this.decimalTextStyle,
    this.textStyle,
    this.showDecimal = true,
    this.controller,
    required this.children,
    this.value = 0.0,
    super.key,
  });

  final NumberFieldController? controller;
  final double value;
  final bool showDecimal;
  final TextStyle? textStyle;
  final TextStyle? decimalTextStyle;
  final List<InlineSpan> children;

  @override
  State createState() => _AnimatedNumberFieldState();
}

class _AnimatedNumberFieldState extends State<AnimatedNumberField> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final NumberFieldController _fieldController;
  int _lastWhole = 0;
  int _lastDecimal = 0;
  late int _whole;
  late int _decimal;

  @override
  void initState() {
    super.initState();
    _fieldController = widget.controller ?? NumberFieldController(initialValue: widget.value);
    _whole = _fieldController.value.value.whole;
    _decimal = widget.showDecimal ? _fieldController.value.value.decimal : 0;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _controller.addListener(_animationControllerListener);
    _fieldController.addListener(_fieldControllerListener);
  }

  @override
  void didUpdateWidget(covariant AnimatedNumberField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _fieldController.setValue(widget.value, animated: false);
    }

    if (oldWidget.controller == widget.controller) {
      return;
    }

    _fieldController.removeListener(_fieldControllerListener);
    _fieldController = widget.controller ?? NumberFieldController();
    _fieldController.addListener(_fieldControllerListener);
  }

  void _animationControllerListener() {
    if (_controller.isCompleted) {
      _lastWhole = _whole;
      _lastDecimal = _decimal;
    }
  }

  void _fieldControllerListener() {
    _whole = _fieldController.value.value.whole;
    _decimal = widget.showDecimal ? _fieldController.value.value.decimal : 0;

    if (_fieldController.value.animated) {
      _controller.reset();
      _controller.forward();
    } else {
      setState(() {
        _lastWhole = _whole;
        _lastDecimal = _decimal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, animationValue, _) {
          final whole = IntTween(begin: _lastWhole, end: _whole).evaluate(_controller);
          final decimal = IntTween(begin: _lastDecimal, end: _decimal).evaluate(_controller);

          return RichText(
            text: TextSpan(
              style: widget.textStyle,
              children: [
                TextSpan(text: '$whole'),
                if (widget.showDecimal)
                  TextSpan(
                    text: '.$decimal',
                    style: widget.decimalTextStyle,
                  ),
                ...widget.children,
              ],
            ),
          );
        });
  }
}
