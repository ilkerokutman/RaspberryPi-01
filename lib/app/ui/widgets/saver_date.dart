import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';

class ScreenSaverDateWidget extends StatelessWidget {
  const ScreenSaverDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(builder: (bc) {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(
            top: CU.toLogical(50),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                CU.displayClock(bc.dateNow, showSeconds: false),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: CU.toLogical(68),
                  fontWeight: FontWeight.w100,
                  color: Colors.white.withOpacity(0.7),
                  height: 1.1,
                ),
              ),
              Text(
                CU.displayDate(bc.dateNow),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: CU.toLogical(18),
                  fontWeight: FontWeight.w100,
                  color: Colors.white.withOpacity(0.7),
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
