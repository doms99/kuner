import 'package:flutter/material.dart';

class KunerToggle extends StatelessWidget {
  const KunerToggle({required this.value, this.onPressed, super.key});

  final VoidCallback? onPressed;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 20,
        width: 32,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 30,
              height: 18,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 50),
              left: value ? 32 - 20 : 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                height: 20,
                width: 20,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: value ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
