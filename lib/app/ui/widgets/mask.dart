import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';

class MaskWidget extends StatelessWidget {
  const MaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(builder: (bc) {
      int min = 0;
      int max = 100;
      int setVal = 50;
      switch (bc.boiler.activeTab) {
        case ActiveTab.setValue:
          min = 150;
          max = 350;
          setVal = bc.boiler.desiredRoomTemperature;
          break;
        case ActiveTab.boiler:
          min = 250;
          max = 850;
          setVal = bc.boiler.desiredBoilerWater;
          break;
        case ActiveTab.hotWater:
          min = 350;
          max = 650;
          setVal = bc.boiler.desiredHotWater;
          break;
      }
      int l = max - min;
      int v = setVal - min;

      double percentage = ((v * 100) / l) / 100;

      double angleInDegrees = ((1 - percentage) * 287 / 100) * 100;

      double startAngle = 2.2;
      return SizedBox(
        width: CU.toLogical(277),
        height: CU.toLogical(277),
        child: Stack(
          children: [
            Transform.flip(
              flipX: true,
              child: CustomPaint(
                painter: SliderPainter(
                  startAngle: startAngle,
                  radius: CU.toLogical(125),
                  angleInDegrees: angleInDegrees,
                  color: Colors.black.withOpacity(0.7),
                  strokeWidth: CU.toLogical(28),
                ),
                child: Container(alignment: Alignment.center),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class SliderPainter extends CustomPainter {
  final double radius;
  final double angleInDegrees;
  final Color color;
  final double strokeWidth;
  final double startAngle;

  SliderPainter(
      {required this.radius,
      required this.angleInDegrees,
      required this.color,
      required this.strokeWidth,
      required this.startAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double angleInRadians = angleInDegrees * pi / 180;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      angleInRadians,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
