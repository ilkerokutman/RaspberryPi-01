import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';

class MaskWidget extends StatelessWidget {
  const MaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(builder: (bc) {
      double rotateAngle = 70; //clockwise radian
      double drawAngle = 82; // degree
      return Container(
        // color: Colors.yellow.withOpacity(0.3),
        width: CU.toLogical(320),
        height: CU.toLogical(320),
        child: Transform.rotate(
          angle: rotateAngle,
          child: CustomPaint(
            painter: RadianPainter(
              length: CU.toLogical(180),
              angleInRadians: drawAngle * pi / 180,
              color: Colors.black.withOpacity(0.7),
              strokeWidth: CU.toLogical(30),
            ),
            size: Size.infinite,
          ),
        ),
      );
    });
  }
}

class RadianPainter extends CustomPainter {
  final double length;
  final double angleInRadians;
  final Color color;
  final double strokeWidth;

  RadianPainter({
    required this.length,
    required this.angleInRadians,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double radius = length / angleInRadians;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2, // Starting angle in radians (90 degrees)
        angleInRadians,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
