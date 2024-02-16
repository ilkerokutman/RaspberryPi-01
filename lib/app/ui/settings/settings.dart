import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/ui/widgets/content.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: () => Get.back(), child: Text("Back")),
            Text("Settings Page"),
            Text("Connectivity Options"),
            Text("Diagnostics")
          ],
        ),
      ),);
  }
}
