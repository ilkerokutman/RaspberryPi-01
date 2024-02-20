import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';
import 'package:pi01/app/ui/widgets/mask.dart';

class CenterDisplayWidget extends StatelessWidget {
  const CenterDisplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(
      builder: (bc) {
        return Center(
          child: SizedBox(
            width: CU.toLogical(320),
            height: CU.toLogical(320),
            child: Stack(
              children: [
                Center(
                  child: CU.image('center_bg.png', w: 320, h: 320),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: CU.toLogical(26)),
                    child: CU.image('radial.png', w: 277, h: 248),
                  ),
                ),
                Center(
                  child: MaskWidget(),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: CU.toLogical(90)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          bc.boiler.activeTab == ActiveTab.boiler
                              ? 'Central Heating\nWater set to'
                              : bc.boiler.activeTab == ActiveTab.hotWater
                                  ? 'Domestic Hot\nWater set to'
                                  : 'Selected Room\nTemperature set to',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: CU.toLogical(12),
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          CU.displayValue(
                            bc.boiler.activeTab == ActiveTab.boiler
                                ? bc.boiler.desiredBoilerWater
                                : bc.boiler.activeTab == ActiveTab.hotWater
                                    ? bc.boiler.desiredHotWater
                                    : bc.boiler.desiredRoomTemperature,
                            presicion: bc.boiler.activeTab == ActiveTab.setValue
                                ? 1
                                : 0,
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: CU.toLogical(65),
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          "CURRENT ${CU.displayValue(
                            bc.boiler.activeTab == ActiveTab.boiler
                                ? bc.boiler.currentBoilerWater
                                : bc.boiler.activeTab == ActiveTab.hotWater
                                    ? bc.boiler.currentHotWater
                                    : bc.boiler.averageRoomTemperature,
                            presicion: bc.boiler.activeTab == ActiveTab.setValue
                                ? 1
                                : 0,
                          )}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: CU.toLogical(13),
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 1 == CU.toLogical(1)
                              ? CU.toLogical(34)
                              : CU.toLogical(18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: bc.onMinusPressed,
                              icon: CU.image('minus.png', w: 20, h: 2),
                              iconSize: CU.toLogical(20),
                              splashRadius: CU.toLogical(20),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    1 == CU.toLogical(1) ? CU.toLogical(10) : 0,
                              ),
                              child: CU.image(
                                'fire_flame_${bc.boiler.flameStatus.toString().split(".").last}.png',
                                w: 33,
                                h: 43,
                              ),
                            ),
                            IconButton(
                              onPressed: bc.onPlusPressed,
                              icon: CU.image('plus.png', w: 20, h: 20),
                              iconSize: CU.toLogical(20),
                              splashRadius: CU.toLogical(20),
                            ),
                          ],
                        )
                      ],
                    ),
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
