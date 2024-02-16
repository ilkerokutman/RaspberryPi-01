import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
