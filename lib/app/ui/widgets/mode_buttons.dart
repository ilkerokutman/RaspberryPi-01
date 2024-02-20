import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/data.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/routes/routes.dart';
import 'package:pi01/app/data/services/boiler.dart';

class ModeButtonsWidget extends StatelessWidget {
  const ModeButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(
      builder: (bc) {
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
                        for (var item in BoilerMode.values)
                          IconButton(
                            onPressed: () async {
                              if (item == BoilerMode.custom) {
                                bc.cancelTimer();
                                await Get.toNamed(Routes.error);
                                bc.startTimer();
                              } else {
                                bc.setMode(item);
                              }
                            },
                            isSelected: bc.boiler.mode == item,
                            icon: CU.image(
                              UiData.menuAssets[item.index],
                              w: 32,
                              h: 32,
                            ),
                            iconSize: CU.toLogical(32),
                            splashRadius: CU.toLogical(32),
                            selectedIcon: CU.image(
                              UiData.menuAssetsActive[item.index],
                              w: 32,
                              h: 32,
                            ),
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
                              borderRadius:
                                  BorderRadius.circular(CU.toLogical(10)),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                UiData.menuTitles[bc.boiler.mode.index],
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
      },
    );
  }
}
