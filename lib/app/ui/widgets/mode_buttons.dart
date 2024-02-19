import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/data.dart';
import 'package:pi01/app/core/utils/common.dart';

class ModeButtonsWidget extends StatelessWidget {
  const ModeButtonsWidget({
    super.key,
    this.selectedIndex = 1,
    required this.onSelected,
  });
  final int selectedIndex;
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: CU.toLogical(98)),
        width: CU.toLogical(400),
        height: CU.toLogical(83),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: CU.toLogical(12)),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CU.toLogical(35)),
                color: Colors.black.withOpacity(0.44),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 5; i++)
                      IconButton(
                        onPressed: () {
                          onSelected(i);
                        },
                        isSelected: i == selectedIndex,
                        icon: CU.image(UiData.menuAssets[i], w: 32, h: 32),
                        iconSize: CU.toLogical(32),
                        splashRadius: CU.toLogical(32),
                        selectedIcon:
                            CU.image(UiData.menuAssetsActive[i], w: 32, h: 32),
                      ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: CU.toLogical(14),
                          vertical: CU.toLogical(5),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(CU.toLogical(10)),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            UiData.menuTitles[selectedIndex],
                            style: TextStyle(
                              fontSize: CU.toLogical(10),
                              fontWeight: FontWeight.w300,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
