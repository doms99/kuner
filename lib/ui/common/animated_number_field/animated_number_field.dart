import 'package:flutter/material.dart';
import 'package:kuner/common/util/separate_double.dart';
import 'package:kuner/ui/common/animated_number_field/number_field_controller.dart';

class AnimatedNumberField extends StatefulWidget {
  const AnimatedNumberField({
    this.decimalTextStyle,
    this.textStyle,
    this.decimal = 2,
    this.controller,
    required this.children,
    this.value = 0.0,
    super.key,
  });

  final NumberFieldController? controller;
  final double value;
  final int decimal;
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

  bool get _showDecimal => widget.decimal != 0;

  @override
  void initState() {
    super.initState();
    _fieldController = widget.controller ?? NumberFieldController(initialValue: widget.value);
    _whole = _lastWhole = _fieldController.value.value.whole;
    _decimal = _lastDecimal = _showDecimal ? _fieldController.value.value.customDecimal(decimals: widget.decimal) : 0;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      value: 1,
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
    _decimal = _showDecimal ? _fieldController.value.value.customDecimal(decimals: widget.decimal) : 0;

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

          final decimalString = decimal == 0 ? '0' : decimal.toString().padLeft(widget.decimal, '0');

          return RichText(
            text: TextSpan(
              style: widget.textStyle,
              children: [
                TextSpan(text: '$whole'),
                if (_showDecimal)
                  TextSpan(
                    text: '.$decimalString',
                    style: widget.decimalTextStyle,
                  ),
                ...widget.children,
              ],
            ),
          );
        });
  }
}
