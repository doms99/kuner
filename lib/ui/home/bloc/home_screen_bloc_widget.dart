import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuner/ui/home/bloc/home_screen_bloc.dart';

class HomeScreenBlocWidget extends StatelessWidget {
  const HomeScreenBlocWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: child,
    );
  }
}
