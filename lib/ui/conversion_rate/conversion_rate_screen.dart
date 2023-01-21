import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kuner/common/util/separate_double.dart';
import 'package:kuner/ui/common/components/conversion_input.dart';
import 'package:kuner/ui/common/components/conversion_output.dart';
import 'package:kuner/ui/common/components/kuner_button.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';
import 'package:kuner/ui/common/wear_os/wear_os_route.dart';
import 'package:kuner/ui/conversion_rate/presenter/conversion_rate_bloc.dart';
import 'package:kuner/ui/conversion_rate/presenter/conversion_rate_bloc_widget.dart';

import 'package:kuner/gen/assets.gen.dart';

class ConversionRateScreen extends StatelessWidget {
  const ConversionRateScreen({super.key});

  static Route route() {
    return WearOsPageRoute<void>(builder: (context) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Conversion rate',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      const ConversionInput(
                        currency: Currency.eur,
                        value: 1,
                        showDecimal: false,
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
                            value: state.conversionRate,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ConversionRateBloc, ConversionRateState>(builder: (context, state) {
            if (state.conversionRate != state.defaultConversionRate) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: KunerButton(
                  onPressed: () => context.read<ConversionRateBloc>().add(const ConversionRateEvent.reset()),
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    Assets.svgs.reset,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              );
            }

            return const SizedBox(height: 34 + 4);
          }),
        ],
      ),
    );
  }
}
