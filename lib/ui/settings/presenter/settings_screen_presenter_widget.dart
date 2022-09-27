import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/ui/settings/presenter/settings_screen_presenter.dart';

class SettingsScreenPresenterWidget extends StatelessWidget {
  const SettingsScreenPresenterWidget({
    this.child,
    required this.builder,
    super.key,
  });

  final Widget? child;
  final Widget Function(BuildContext, Widget?) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsScreenPresenter(
        GetIt.I.get(),
      ),
      child: Builder(builder: (context) {
        return builder(context, child);
      }),
    );
  }
}
