import 'package:flutter/material.dart';
import 'package:kuner/common/util/separate_double.dart';
import 'package:kuner/ui/common/components/conversion_input.dart';
import 'package:kuner/ui/common/components/conversion_output.dart';
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
          const Text('12:13'),
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
                        return ConversionInput(
                          currency: state.direction.input,
                          whole: state.inputValue.whole,
                          decimal: state.inputValue.decimal,
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
                            whole: state.convertedValue.whole,
                            decimal: state.showDecimal ? state.convertedValue.decimal : null,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 34),
        ],
      ),
    );
  }
}
