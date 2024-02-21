import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/data.dart';
import 'package:pi01/app/data/services/boiler.dart';
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
  late Timer _timer;
  int _currentPageIndex = 1;
  final BoilerController boilerController = Get.find();

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(
      initialPage: _currentPageIndex,
    );
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: _currentPageIndex,
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        boilerController.cancelTimer();
        boilerController.startTimer();
      },
      child: CircleContentWidget(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              physics: const BouncingScrollPhysics(),
              children: UiData.pagerTabs,
            ),
            PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              isOnDesktopAndWeb: _isOnDesktopAndWeb,
            ),
            const DemoLabelWidget(),
          ],
        ),
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
    boilerController.cancelTimer();
    boilerController.startTimer();
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
}
