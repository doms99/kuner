import 'package:flutter/material.dart';
import 'package:kuner/ui/common/animated_number_field/animated_number_field.dart';
import 'package:kuner/ui/common/components/currency_icon.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';

class ConversionOutput extends StatelessWidget {
  const ConversionOutput({
    required this.currency,
    required this.value,
    this.showDecimal = true,
    super.key,
  });

  final double value;
  final bool showDecimal;
  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return AnimatedNumberField(
      value: value,
      textStyle: themeData.numberTheme.displayLarge!.copyWith(
        color: themeData.colorScheme.onBackground,
      ),
      decimalTextStyle: themeData.numberTheme.displaySmall!.copyWith(
        color: themeData.colorScheme.onBackground,
      ),
      showDecimal: showDecimal,
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
