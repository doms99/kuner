import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kuner/common/util/separate_double.dart';

class AnimatedNumberField extends StatefulWidget {
  const AnimatedNumberField({
    this.decimalTextStyle,
    this.textStyle,
    this.showDecimal = true,
    required this.children,
    required this.value,
    super.key,
  });

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
  int _lastWhole = 0;
  int _lastDecimal = 0;
  late int _whole;
  late int _decimal;

  @override
  void initState() {
    super.initState();

    _whole = widget.value.whole;
    _decimal = widget.showDecimal ? widget.value.decimal : 0;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _controller.addListener(_animationControllerListener);
  }

  @override
  void didUpdateWidget(covariant AnimatedNumberField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value == widget.value) {
      return;
    }

    _lastWhole = _whole;
    _lastDecimal = _decimal;
    _whole = widget.value.whole;
    _decimal = widget.value.decimal;

    _controller.reset();
    _controller.forward();
  }

  void _animationControllerListener() {
    if (_controller.isCompleted) {
      _lastWhole = _whole;
      _lastDecimal = _decimal;
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
