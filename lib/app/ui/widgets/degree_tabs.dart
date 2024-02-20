import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/widgets/degree_tab.dart';

class DegreeTabsWidget extends StatelessWidget {
  const DegreeTabsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-1, 0),
      child: SizedBox(
        width: CU.toLogical(254),
        height: CU.toLogical(234),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DegreeTabItemWidget(itemType: ActiveTab.setValue),
            DegreeTabItemWidget(itemType: ActiveTab.boiler),
            DegreeTabItemWidget(itemType: ActiveTab.hotWater),
          ],
        ),
      ),
    );
  }
}
