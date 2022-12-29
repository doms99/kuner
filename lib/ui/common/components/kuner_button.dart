import 'package:flutter/material.dart';

class KunerButton extends StatelessWidget {
  const KunerButton({
    required this.child,
    required this.onPressed,
    this.expands = false,
    this.disabled = false,
    this.circular = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    super.key,
  });

  final Widget child;
  final bool disabled;
  final bool expands;
  final bool circular;
  final VoidCallback? onPressed;
  final EdgeInsets padding;

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
          child: Container(
            width: expands ? double.infinity : null,
            decoration: circular ? const BoxDecoration(shape: BoxShape.circle) : null,
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
