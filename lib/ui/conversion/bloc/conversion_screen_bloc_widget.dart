import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/ui/conversion/bloc/conversion_screen_bloc.dart';

class ConversionScreenBlocWidget extends StatelessWidget {
  const ConversionScreenBlocWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversionScreenBloc(
        GetIt.I.get(),
        GetIt.I.get(),
        GetIt.I.get(),
      ),
      child: child,
    );
  }
}
