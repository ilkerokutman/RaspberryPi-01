import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/screens/home.dart';
import 'package:pi01/app/ui/screens/weather.dart';
import 'package:pi01/app/ui/screens/weekly.dart';
import 'package:pi01/app/ui/widgets/content.dart';
import 'package:pi01/app/ui/widgets/demo.dart';
import 'package:pi01/app/ui/widgets/page_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  DegreeControlTabItem activeDegreeControlTab = DegreeControlTabItem.setValue;
  int _currentPageIndex = 1;
  bool hasError = false;
  int currentModeIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: 1);
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            physics: BouncingScrollPhysics(),
            children: [
              WeeklyScreen(),
              HomeScreen(
                activeItem: activeDegreeControlTab,
                degreeTabCallback: onDegreeControlTabClicked,
                hasError: hasError,
                onModeSelected: onModeSelected,
                selectedMode: currentModeIndex,
              ),
              WeatherScreen(),
            ],
          ),
          PageIndicator(
            tabController: _tabController,
            currentPageIndex: _currentPageIndex,
            onUpdateCurrentPageIndex: _updateCurrentPageIndex,
            isOnDesktopAndWeb: _isOnDesktopAndWeb,
          ),
          DemoLabelWidget(),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }

  void onDegreeControlTabClicked(DegreeControlTabItem item) {
    setState(() {
      activeDegreeControlTab = item;
    });
  }

  void onModeSelected(int i) {
    setState(() {
      currentModeIndex = i;
      if (i == 0 || i == 3) {
        activeDegreeControlTab = DegreeControlTabItem.hotWater;
      } else if (i == 1 || i == 2) {
        activeDegreeControlTab = DegreeControlTabItem.setValue;
      }
    });
  }
}
