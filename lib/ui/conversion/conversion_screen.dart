import 'package:flutter/material.dart';
import 'package:kuner/ui/common/components/conversion_input.dart';
import 'package:kuner/ui/common/components/conversion_output.dart';
import 'package:kuner/ui/common/components/kuner_conversion_toggle.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_action.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_presenter.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_presenter_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final viewState = context.watch<ConversionScreenPresenter>();

    return Scaffold(
      body: Column(
        children: [
          const Text('12:13'),
          const SizedBox(height: 2),
          KunerConversionToggle(
            direction: viewState.state.direction,
            onPressed: () => viewState.add(const ConversionScreenAction.conversionTogglePressed()),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ConversionInput(
                      currency: viewState.state.direction.input,
                      whole: viewState.state.input.whole,
                      decimal: viewState.state.input.decimal,
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
                      child: ConversionOutput(
                        currency: viewState.state.direction.output,
                        whole: viewState.state.converted.whole,
                        decimal: viewState.state.converted.decimal,
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
