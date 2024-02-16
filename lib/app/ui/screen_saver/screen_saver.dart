import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSaverScreen extends StatelessWidget {
  const ScreenSaverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: const Center(
            child: Text("Screensaver here"),
          ),
        ),
      ),
    );
  }
}
