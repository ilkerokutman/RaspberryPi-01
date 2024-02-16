import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:pi01/app/core/constants/dimens.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/data/routes/routes.dart';
import 'package:pi01/app/data/services/boiler.dart';
import 'package:pi01/app/ui/widgets/content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: GetBuilder<BoilerController>(builder: (bc) {
        return Center(
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
              Divider(),
              Text("Boiler Temperature: 64 + / - buttons"),
              Text("Water Temperature: 47 + / - buttons"),
              Text(
                  "Room Temperature SET 22 + / - buttons and slider/radial slider"),
              Divider(),
              Text("Current Room 1 T: 18.3"),
              Text("Current Room 2 T: 19.7 (selected room indicator)"),
              Text("Current Room 3 T: 22.1"),
              Text("Average T: 22.1"),
              Divider(),
              Text("Pressure: 1.0 bar"),
              Text("flame  icon"),
              IconButton(
                icon: Icon(
                  Icons.power_settings_new,
                  color: bc.boiler.boilerStatus == BoilerStatus.on
                      ? Colors.green
                      : Colors.grey,
                ),
                onPressed: () => Get.toNamed(Routes.powerOff),
              ),
              Text("mode button: winter/summer"),
            ],
          ),
        );
      }),
    );
  }
}
