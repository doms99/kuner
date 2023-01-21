import 'package:flutter/material.dart';
import 'package:kuner/ui/common/animated_number_field/animated_number_field.dart';
import 'package:kuner/ui/common/components/currency_icon.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';

class ConversionInput extends StatelessWidget {
  const ConversionInput({
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
      showDecimal: showDecimal,
      value: value,
      textStyle: themeData.numberTheme.titleLarge!.copyWith(
        color: themeData.colorScheme.surfaceVariant,
      ),
      decimalTextStyle: themeData.numberTheme.titleMedium!.copyWith(
        color: themeData.colorScheme.surfaceVariant,
      ),
      children: [
        WidgetSpan(
          baseline: TextBaseline.alphabetic,
          alignment: PlaceholderAlignment.aboveBaseline,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: CurrencyIcon.small(currency: currency),
          ),
        ),
      ],
    );
  }
}
