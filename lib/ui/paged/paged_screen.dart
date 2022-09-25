import 'dart:math';

import 'package:flutter/material.dart';

import 'package:kuner/ui/conversion/conversion_screen.dart';
import 'package:kuner/ui/options/options_screen.dart';

class PagedScreen extends StatefulWidget {
  const PagedScreen({super.key});

  @override
  State<PagedScreen> createState() => _PagedScreenState();
}

class _PagedScreenState extends State<PagedScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: const [
            ConversionScreen(),
            OptionsScreen(),
          ],
        ),
        AnimatedBuilder(
          animation: _pageController,
          builder: (context, _) {
            return Positioned(
              height: 24,
              width: 24,
              bottom: (_pageController.page ?? 0) * (size.height - 24),
              child: _Arrow(_pageController.page ?? 0),
            );
          },
        ),
      ],
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow(
    this.pagePercentage,
  );

  final double pagePercentage;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArrowPainter(context, pagePercentage),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  _ArrowPainter(this.context, this.percentageScrolled);

  final BuildContext context;
  final double percentageScrolled;

  @override
  void paint(Canvas canvas, Size size) {
    // _drawBackground(canvas, size);

    final width = 6 * sqrt(2);
    final height = width / 2;
    final horizontalOffset = (size.width - width) / 2;
    final middleVerticalOffset = (size.height - height) / 2 + height;
    final currentMiddleVerticalOffset = middleVerticalOffset - 2 * height * percentageScrolled;
    final outerVerticalOffset = middleVerticalOffset - height;

    final leftOuterOffset = Offset(horizontalOffset, outerVerticalOffset);
    final middleOffset = Offset(size.width / 2, currentMiddleVerticalOffset);
    final rightOuterOffset = Offset(horizontalOffset + width, outerVerticalOffset);

    final paint = Paint()..color = Theme.of(context).colorScheme.surface;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(leftOuterOffset.dx, leftOuterOffset.dy);
    path.lineTo(middleOffset.dx, middleOffset.dy);
    path.lineTo(rightOuterOffset.dx, rightOuterOffset.dy);

    canvas.drawPath(path, paint);
  }

  void _drawBackground(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..color = Colors.red);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 2, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(_ArrowPainter oldDelegate) => percentageScrolled != oldDelegate.percentageScrolled;

  @override
  bool shouldRebuildSemantics(_ArrowPainter oldDelegate) => false;
}
