import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/widgets/center.dart';
import 'package:pi01/app/ui/widgets/date.dart';
import 'package:pi01/app/ui/widgets/degree_tabs.dart';
import 'package:pi01/app/ui/widgets/mini_weather.dart';
import 'package:pi01/app/ui/widgets/mode_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.activeItem,
    required this.degreeTabCallback,
    this.hasError = false,
    required this.onModeSelected,
    this.selectedMode = 1,
  });
  final DegreeControlTabItem activeItem;
  final Function(DegreeControlTabItem) degreeTabCallback;
  final bool hasError;
  final Function(int) onModeSelected;
  final int selectedMode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CU.image('bg_home_on.png', w: 720, h: 720),
        Opacity(
          opacity: 0,
          child: CU.image('draft_home.png', w: 720, h: 720),
        ),
        DateTimeDisplayWidget(),
        MiniWeatherWidget(),
        DegreeTabsWidget(
          activeItem: activeItem,
          callback: degreeTabCallback,
          disabled: hasError,
          selectedMode: selectedMode,
        ),
        CenterDisplayWidget(),
        ModeButtonsWidget(
          onSelected: onModeSelected,
          selectedIndex: selectedMode,
        ),
      ],
    );
  }
}
