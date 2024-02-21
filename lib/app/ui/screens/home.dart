import 'package:flutter/material.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/widgets/center.dart';
import 'package:pi01/app/ui/widgets/date.dart';
import 'package:pi01/app/ui/widgets/degree_tabs.dart';
import 'package:pi01/app/ui/widgets/mini_weather.dart';
import 'package:pi01/app/ui/widgets/mode_buttons.dart';
import 'package:pi01/app/ui/widgets/rooms.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CU.image('bg_home_on.png', w: 720, h: 720),
        const DateTimeDisplayWidget(hasLink: true),
        const MiniWeatherWidget(),
        const DegreeTabsWidget(),
        const RoomInfoWidget(),
        const CenterDisplayWidget(),
        const ModeButtonsWidget(),
        // Opacity(
        //   opacity: 0.3,
        //   child: Image.asset('assets/images/draft_home.png'),
        // )
      ],
    );
  }
}
