import 'package:flutter/material.dart';
import 'package:pi01/app/core/utils/common.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(bottom: CU.toLogical(36)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (1 == CU.toLogical(1))
            IconButton(
              splashRadius: CU.toLogical(16),
              padding: EdgeInsets.zero,
              onPressed: () {
                if (currentPageIndex == 0) {
                  return;
                }
                onUpdateCurrentPageIndex(currentPageIndex - 1);
              },
              icon: Icon(
                Icons.arrow_left_rounded,
                size: CU.toLogical(32),
                // color: Colors.white.withOpacity(0.1),
              ),
            ),
          TabPageSelector(
            controller: tabController,
            color: Colors.white.withOpacity(0.4),
            selectedColor: Colors.white,
            indicatorSize: CU.toLogical(10),
            borderStyle: BorderStyle.none,
          ),
          if (1 == CU.toLogical(1))
            IconButton(
              splashRadius: CU.toLogical(16),
              padding: EdgeInsets.zero,
              onPressed: () {
                if (currentPageIndex == 2) {
                  return;
                }
                onUpdateCurrentPageIndex(currentPageIndex + 1);
              },
              icon: Icon(
                Icons.arrow_right_rounded,
                size: CU.toLogical(32),
                // color: Colors.white.withOpacity(0.1),
              ),
            ),
        ],
      ),
    );
  }
}
