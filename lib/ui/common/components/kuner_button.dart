import 'package:flutter/material.dart';

class KunerButton extends StatelessWidget {
  const KunerButton({
    required this.child,
    required this.onPressed,
    this.disabled = false,
    super.key,
  });

  final Widget child;
  final bool disabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return IgnorePointer(
      ignoring: disabled,
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: disabled ? themeData.colorScheme.surfaceVariant : themeData.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: child,
          ),
        ),
      ),
    );
  }
}
