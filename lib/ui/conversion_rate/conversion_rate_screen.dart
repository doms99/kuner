import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuner/common/util/separate_double.dart';
import 'package:kuner/ui/common/components/conversion_input.dart';
import 'package:kuner/ui/common/components/conversion_output.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';
import 'package:kuner/ui/conversion_rate/presenter/conversion_rate_bloc.dart';
import 'package:kuner/ui/conversion_rate/presenter/conversion_rate_bloc_widget.dart';

class ConversionRateScreen extends StatelessWidget {
  const ConversionRateScreen({super.key});

  static Route route() {
    return CupertinoPageRoute<void>(builder: (context) {
      return const ConversionRateScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ConversionRateBlocWidget(
      child: _ConversionRateScreen(),
    );
  }
}

class _ConversionRateScreen extends StatelessWidget {
  const _ConversionRateScreen({super.key});

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
                    const ConversionInput(
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
                    child: BlocBuilder<ConversionRateBloc, ConversionRateState>(
                      builder: (context, state) {
                        return ConversionOutput(
                          currency: Currency.hrk,
                          whole: state.conversionRate.whole,
                          decimal: state.conversionRate.customDecimal(decimals: 5),
                        );
                      },
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