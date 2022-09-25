import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.count,
    required this.selected,
    super.key,
  })  : assert(count > 0),
        assert(selected >= 0),
        assert(selected <= count);

  final int count;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: _Dot(selected: index == selected),
        );
      }),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.selected, super.key});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: selected ? colors.surface : colors.surfaceVariant,
      ),
      clipBehavior: Clip.antiAlias,
      height: 4,
      width: 4,
    );
  }
}
