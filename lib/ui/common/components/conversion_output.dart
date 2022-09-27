import 'package:flutter/material.dart';
import 'package:kuner/ui/common/components/currency_icon.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';

class ConversionOutput extends StatelessWidget {
  const ConversionOutput({
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
        style: themeData.numberTheme.displayLarge!.copyWith(
          color: themeData.colorScheme.onBackground,
        ),
        children: [
          TextSpan(text: '$whole'),
          if (decimal != null)
            TextSpan(
              text: '.$decimal',
              style: themeData.numberTheme.displaySmall!.copyWith(
                color: themeData.colorScheme.onBackground,
              ),
            ),
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
      ),
    );
  }
}
