import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kuner/gen/assets.gen.dart';
import 'package:kuner/ui/common/components/kuner_button.dart';
import 'package:kuner/ui/common/components/models/conversion_direction.dart';

class KunerConversionToggle extends StatelessWidget {
  const KunerConversionToggle({
    required this.direction,
    required this.onPressed,
    super.key,
  });

  final ConversionDirection direction;
  final VoidCallback onPressed;

  String get _firstLabel {
    switch (direction) {
      case ConversionDirection.hrk_eur:
        return 'HRK';
      case ConversionDirection.eur_hrk:
        return 'EUR';
    }
  }

  String get _secondLabel {
    switch (direction) {
      case ConversionDirection.hrk_eur:
        return 'EUR';
      case ConversionDirection.eur_hrk:
        return 'HRK';
    }
  }

  @override
  Widget build(BuildContext context) {
    return KunerButton(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 50),
            child: Text(
              _firstLabel,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
          const SizedBox(width: 4),
          SvgPicture.asset(Assets.svgs.rightArrow, height: 12),
          const SizedBox(width: 4),
          AnimatedSize(
            duration: const Duration(milliseconds: 50),
            child: Text(
              _secondLabel,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
