import 'package:flutter/material.dart';
import 'package:kuner/ui/common/animated_number_field/animated_number_field.dart';
import 'package:kuner/ui/common/animated_number_field/number_field_controller.dart';
import 'package:kuner/ui/common/components/currency_icon.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';

class ConversionOutput extends StatelessWidget {
  const ConversionOutput({
    required this.currency,
    this.value = 0.0,
    this.controller,
    this.decimal = 2,
    super.key,
  });

  final NumberFieldController? controller;
  final double value;
  final int decimal;
  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return AnimatedNumberField(
      decimal: decimal,
      controller: controller,
      value: value,
      textStyle: themeData.numberTheme.displayLarge!.copyWith(
        color: themeData.colorScheme.onBackground,
      ),
      decimalTextStyle: themeData.numberTheme.displaySmall!.copyWith(
        color: themeData.colorScheme.onBackground,
      ),
      children: [
        WidgetSpan(
          baseline: TextBaseline.alphabetic,
          alignment: PlaceholderAlignment.aboveBaseline,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 50),
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: CurrencyIcon.large(currency: currency),
            ),
          ),
        )
      ],
    );
  }
}
