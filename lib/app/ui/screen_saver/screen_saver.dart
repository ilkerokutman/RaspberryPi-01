import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/ui/widgets/content.dart';

class ScreenSaverScreen extends StatelessWidget {
  const ScreenSaverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: const Center(
            child: Text(
                "Screensaver here\ndate-time\ntemperature of rooms\nflame icon"),
          ),
        ),
      ),
    );
  }
}
