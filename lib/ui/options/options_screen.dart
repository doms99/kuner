import 'package:flutter/material.dart';
import 'package:kuner/ui/common/components/kuner_button.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KunerButton(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                expands: true,
                onPressed: () {},
                child: Text(
                  'Conversion rate',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              const SizedBox(height: 8),
              KunerButton(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                expands: true,
                onPressed: () {},
                child: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
