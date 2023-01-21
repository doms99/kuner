import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kuner/common/util/separate_double.dart';
import 'package:kuner/gen/gen.dart';
import 'package:kuner/ui/common/clock/clock_widget.dart';
import 'package:kuner/ui/common/components/conversion_input.dart';
import 'package:kuner/ui/common/components/conversion_output.dart';
import 'package:kuner/ui/common/components/kuner_button.dart';
import 'package:kuner/ui/common/components/kuner_conversion_toggle.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_action.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_presenter.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_presenter_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_view_state.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConversionScreenPresenterWidget(
      child: _ConversionScreen(),
    );
  }
}

class _ConversionScreen extends StatelessWidget {
  const _ConversionScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ClockWidget(),
          const SizedBox(height: 2),
          BlocBuilder<ConversionScreenPresenter, ConversionScreenViewState>(
            builder: (context, state) {
              return KunerConversionToggle(
                direction: state.direction,
                onPressed: () => context.read<ConversionScreenPresenter>().add(
                      const ConversionScreenAction.conversionTogglePressed(),
                    ),
              );
            },
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: BlocBuilder<ConversionScreenPresenter, ConversionScreenViewState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () =>
                              context.read<ConversionScreenPresenter>().add(const ConversionScreenAction.inputTap()),
                          child: ConversionInput(
                            currency: state.direction.input,
                            showDecimal: true,
                            value: state.inputValue,
                          ),
                        );
                      },
                    ),
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
                      child: BlocBuilder<ConversionScreenPresenter, ConversionScreenViewState>(
                        builder: (context, state) {
                          return ConversionOutput(
                            currency: state.direction.output,
                            value: state.convertedValue,
                            showDecimal: state.showDecimal,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ConversionScreenPresenter, ConversionScreenViewState>(builder: (context, state) {
            if (state.inputValue != 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: KunerButton(
                  onPressed: () =>
                      context.read<ConversionScreenPresenter>().add(const ConversionScreenAction.newInputValue(0)),
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
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
