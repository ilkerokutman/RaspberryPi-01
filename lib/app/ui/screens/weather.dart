import 'package:flutter/material.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/widgets/date.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CU.image('draft_weather.png', w: 720, h: 720),
        DateTimeDisplayWidget(),
      ],
    );
  }
}
