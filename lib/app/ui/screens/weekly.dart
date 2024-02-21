import 'package:flutter/material.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/widgets/date.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CU.image('bg_weekly.png', w: 720, h: 720),
        const DateTimeDisplayWidget(),
      ],
    );
  }
}
