import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/ui/widgets/content.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: () => Get.back(), child: Text("Close/Back")),
            Text(
                "Detailed Weather Here\nCurrent temp, min temp, max temp, weather status image\nhumidity, wind speed,direction")
          ],
        ),
      ),
    );
  }
}
