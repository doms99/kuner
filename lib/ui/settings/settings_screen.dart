import 'package:flutter/material.dart';
import 'package:kuner/ui/common/components/kuner_toggle.dart';
import 'package:kuner/ui/common/wear_os/wear_os_route.dart';
import 'package:kuner/ui/settings/bloc/settings_screen_event.dart';
import 'package:kuner/ui/settings/bloc/settings_screen_bloc.dart';
import 'package:kuner/ui/settings/bloc/settings_screen_bloc_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static Route route() {
    return WearOsPageRoute<void>(
      builder: (context) => const SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SettingsScreenBlocWidget(
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Decimal',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    KunerToggle(
                      value: context.watch<SettingsScreenBloc>().state.showDecimal,
                      onPressed: () => context.read<SettingsScreenBloc>().add(const SettingsScreenEvent.toggle()),
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
