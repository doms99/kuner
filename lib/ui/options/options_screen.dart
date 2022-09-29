import 'package:flutter/material.dart';
import 'package:kuner/device/model/conversion_rate_holder.dart';
import 'package:kuner/ui/common/components/kuner_button.dart';
import 'package:kuner/ui/conversion_rate/conversion_rate_screen.dart';
import 'package:kuner/ui/settings/settings_screen.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KunerButton(
              expands: true,
              onPressed: () => Navigator.of(context).push<void>(ConversionRateScreen.route()),
              child: Text(
                'Conversion rate',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            const SizedBox(height: 4),
            KunerButton(
              expands: true,
              onPressed: () => Navigator.of(context).push<void>(SettingsScreen.route()),
              child: Text(
                'Settings',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
