import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/ui/conversion/presenter/conversion_screen_presenter.dart';

class ConversionScreenPresenterWidget extends StatelessWidget {
  const ConversionScreenPresenterWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversionScreenPresenter(GetIt.I.get()),
      child: child,
    );
  }
}
