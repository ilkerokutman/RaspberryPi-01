import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/data.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';

class ScreenSaverMode extends StatelessWidget {
  const ScreenSaverMode({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(
      builder: (bc) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
              bottom: CU.toLogical(194),
            ),
            child: Opacity(
              opacity: 0.4,
              child: CU.image(
                UiData.menuAssetsActive[bc.boiler.mode.index],
              ),
            ),
          ),
        );
      },
    );
  }
}
