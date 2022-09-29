import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_presenter.dart';
import 'package:kuner/ui/conversion_rate/presenter/conversion_rate_bloc.dart';

class ConversionRateBlocWidget extends StatelessWidget {
  const ConversionRateBlocWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversionRateBloc(
        GetIt.I.get(),
        GetIt.I.get(),
      ),
      child: child,
    );
  }
}
