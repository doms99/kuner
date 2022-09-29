import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuner/ui/common/components/conversion_input.dart';
import 'package:kuner/ui/common/components/conversion_output.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';

class ConversionRateScreen extends StatelessWidget {
  const ConversionRateScreen({super.key});

  static Route route() {
    return CupertinoPageRoute<void>(builder: (context) {
      return const ConversionRateScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    ConversionInput(
                      currency: Currency.eur,
                      whole: 1,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '=',
                      style: Theme.of(context).numberTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ConversionOutput(
                      currency: Currency.hrk,
                      whole: 7,
                      decimal: 5345,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Conversion rate',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
