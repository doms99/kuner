import 'dart:math';

import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  const Toggle({this.initialValue, this.onChanged, super.key});

  final ValueChanged<bool>? onChanged;
  final bool? initialValue;

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  late bool enabled;

  @override
  void initState() {
    super.initState();

    enabled = widget.initialValue ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(!enabled);
        setState(() {
          enabled = !enabled;
        });
      },
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
              left: enabled ? 32 - 20 : 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                height: 20,
                width: 20,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: enabled ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
