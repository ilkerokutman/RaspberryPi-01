import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
