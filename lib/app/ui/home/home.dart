import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pi01/app/core/constants/dimens.dart';
import 'package:pi01/app/data/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: UiDimens.screenSize,
          height: UiDimens.screenSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).canvasColor,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.weather),
                    child: Text("Weather 13.2 C")),
                ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.weeklyPlan),
                    child: Text("weekly plan")),
                ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.settings),
                    child: Text("settings")),
                ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.screenSaver),
                    child: Text("screensaver trigger")),
                Text("Boiler Temperature: 64"),
                Text("Water Temperature: 47"),
                Text("Room Temperature SET 22"),
                Text("Current Room 1 T: 18.3"),
                Text("Current Room 2 T: 19.7 * selected"),
                Text("Current Room 3 T: 22.1"),
                Text("Pressure: 1.0 bar"),
                Text("flame  icon"),
                Text("on/off button"),
                Text("mode button: winter/summer"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
