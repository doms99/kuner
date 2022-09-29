import 'package:flutter/material.dart';
import 'package:kuner/ui/common/components/currency_icon.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';

class ConversionInput extends StatelessWidget {
  const ConversionInput({
    required this.currency,
    required this.whole,
    this.decimal,
    super.key,
  });

  final int? decimal;
  final int whole;
  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return RichText(
      text: TextSpan(
        style: themeData.numberTheme.titleMedium!.copyWith(
          color: themeData.colorScheme.surfaceVariant,
        ),
        children: [
          TextSpan(text: '$whole'),
          if (decimal != null) TextSpan(text: '.$decimal'),
          WidgetSpan(
            baseline: TextBaseline.alphabetic,
            alignment: PlaceholderAlignment.aboveBaseline,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: CurrencyIcon.small(currency: currency),
            ),
          ),
        ],
      ),
    );
  }
}
