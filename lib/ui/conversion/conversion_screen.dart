import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kuner/gen/gen.dart';
import 'package:kuner/ui/common/animated_number_field/use_number_field.dart';
import 'package:kuner/ui/common/clock/clock_widget.dart';
import 'package:kuner/ui/common/components/conversion_input.dart';
import 'package:kuner/ui/common/components/conversion_output.dart';
import 'package:kuner/ui/common/components/kuner_button.dart';
import 'package:kuner/ui/common/components/kuner_conversion_toggle.dart';
import 'package:kuner/ui/conversion/bloc/conversion_screen_bloc.dart';
import 'package:kuner/ui/conversion/bloc/conversion_screen_bloc_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuner/ui/home/bloc/home_screen_bloc.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConversionScreenBlocWidget(
      child: _ConversionScreen(),
    );
  }
}

class _ConversionScreen extends HookWidget {
  const _ConversionScreen();

  @override
  Widget build(BuildContext context) {
    final inputController = useNumberField(initialValue: context.read<ConversionScreenBloc>().state.inputValue);
    final outputController = useNumberField(initialValue: context.read<ConversionScreenBloc>().state.convertedValue);

    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        final event = state.currentPage == 0
            ? const ConversionScreenEvent.enableRotary()
            : const ConversionScreenEvent.disableRotary();
        context.read<ConversionScreenBloc>().add(event);
      },
      child: BlocListener<ConversionScreenBloc, ConversionScreenState>(
        listener: (context, state) {
          inputController.setValue(state.inputValue, animated: state.animate);
          outputController.setValue(state.convertedValue, animated: state.animate);
        },
        child: Scaffold(
          body: Column(
            children: [
              const ClockWidget(),
              const SizedBox(height: 2),
              BlocBuilder<ConversionScreenBloc, ConversionScreenState>(
                builder: (context, state) {
                  return KunerConversionToggle(
                    direction: state.direction,
                    onPressed: () => context.read<ConversionScreenBloc>().add(
                          const ConversionScreenEvent.conversionTogglePressed(),
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
                        child: BlocBuilder<ConversionScreenBloc, ConversionScreenState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: state.showDecimal
                                  ? () =>
                                      context.read<ConversionScreenBloc>().add(const ConversionScreenEvent.inputTap())
                                  : null,
                              child: ConversionInput(
                                currency: state.direction.input,
                                decimal: state.showDecimal ? 2 : 0,
                                controller: inputController,
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
                          child: BlocBuilder<ConversionScreenBloc, ConversionScreenState>(
                            builder: (context, state) {
                              return ConversionOutput(
                                currency: state.direction.output,
                                controller: outputController,
                                decimal: state.showDecimal ? 2 : 0,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ConversionScreenBloc, ConversionScreenState>(builder: (context, state) {
                return IgnorePointer(
                  ignoring: state.inputValue == 0,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 100),
                    scale: state.inputValue == 0 ? 0 : 1,
                    curve: Curves.easeOut,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: KunerButton(
                        onPressed: () => context.read<ConversionScreenBloc>().add(const ConversionScreenEvent.reset()),
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          Assets.svgs.reset,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                );
                // return const SizedBox(height: 34 + 4);
              }),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
