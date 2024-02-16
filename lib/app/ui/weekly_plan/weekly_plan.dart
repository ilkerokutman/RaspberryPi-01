import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/ui/widgets/content.dart';

class WeeklyPlanScreen extends StatelessWidget {
  const WeeklyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: () => Get.back(), child: Text("close/back")),
            Text("Weekly Plan here\n7 day 24 hrs")
          ],
        ),
      ),
    );
  }
}
