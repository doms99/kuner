import 'dart:math';

import 'package:flutter/material.dart';

import 'package:kuner/ui/conversion/conversion_screen.dart';
import 'package:kuner/ui/options/options_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            scrollBehavior: const MaterialScrollBehavior(),
            children: const [
              ConversionScreen(),
              OptionsScreen(),
            ],
          ),
        ),
        AnimatedBuilder(
          animation: _pageController,
          builder: (context, _) {
            return Positioned(
              height: 24,
              width: 24,
              bottom: (_pageController.page ?? 0) * (size.height - 24),
              child: IgnorePointer(
                child: _Arrow(_pageController.page ?? 0),
              ),
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
  _ArrowPainter(
    this.context,
    this.percentageScrolled,
  ) : assert(percentageScrolled >= 0 && percentageScrolled <= 1);

  static const lineLength = 6.0;
  static const arrowHeight = 6.0 * 1.41421356 / 2; // half of the diagonal

  final BuildContext context;
  final double percentageScrolled;

  double get _currentWidth {
    return lineLength * pow(2, 1 - (percentageScrolled - 0.5).abs());
  }

  double get _currentHeight {
    return 2 * arrowHeight * (percentageScrolled - 0.5).abs() * 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // _drawBackground(canvas, size);

    final horizontalOffset = (size.width - _currentWidth) / 2;
    final topArrowOffset = (size.height - _currentHeight) / 2;
    final middleVerticalOffset = topArrowOffset + _currentHeight * (1 - percentageScrolled);
    final outerVerticalOffset = topArrowOffset + _currentHeight / 2;

    final leftOuterOffset = Offset(horizontalOffset, outerVerticalOffset);
    final middleOffset = Offset(size.width / 2, middleVerticalOffset);
    final rightOuterOffset = Offset(horizontalOffset + _currentWidth, outerVerticalOffset);

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
