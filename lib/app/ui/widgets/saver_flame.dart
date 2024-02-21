import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';

class ScreenSaverFlame extends StatelessWidget {
  const ScreenSaverFlame({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(
      builder: (bc) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(
              bottom: CU.toLogical(22),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.4,
                  child: CU.image(
                    'screen_saver_flame.png',
                    w: 93,
                    h: 122,
                  ),
                ),
                Text(
                  CU.displayValue(
                    bc.boiler.desiredRoomTemperature,
                    presicion: 1,
                    suffix: ValueSuffix.celcius,
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: CU.toLogical(51),
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.4),
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
