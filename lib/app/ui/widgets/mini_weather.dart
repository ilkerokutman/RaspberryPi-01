import 'package:flutter/material.dart';
import 'package:pi01/app/core/utils/common.dart';

class MiniWeatherWidget extends StatelessWidget {
  const MiniWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: CU.toLogical(128)),
        width: CU.toLogical(210),
        height: CU.toLogical(62),
        child: CU.image('weather.png', w: 210, h: 62),
      ),
    );
  }
}
