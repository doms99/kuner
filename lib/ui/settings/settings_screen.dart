import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuner/ui/common/components/kuner_toggle.dart';
import 'package:kuner/ui/settings/presenter/settings_screen_action.dart';
import 'package:kuner/ui/settings/presenter/settings_screen_presenter.dart';
import 'package:kuner/ui/settings/presenter/settings_screen_presenter_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static Route route() {
    return CupertinoPageRoute<void>(
      builder: (context) => const SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SettingsScreenPresenterWidget(
      builder: (context, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(100),
                ),
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Decimal',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    KunerToggle(
                      value: context.watch<SettingsScreenPresenter>().state.showDecimal,
                      onPressed: () => context.read<SettingsScreenPresenter>().add(const SettingsScreenAction.toggle()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
