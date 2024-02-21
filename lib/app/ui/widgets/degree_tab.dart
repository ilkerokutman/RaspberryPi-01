import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';

class DegreeTabItemWidget extends StatelessWidget {
  const DegreeTabItemWidget({
    super.key,
    required this.itemType,
  });
  final ActiveTab itemType;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(builder: (bc) {
      String labelText = '';
      String titleText = '';
      Widget image = Container();
      Color color1 = Colors.transparent;
      Color color2 = Colors.black.withOpacity(0.4);
      bool isSelected = false;
      bool disabled = false;

      switch (itemType) {
        case ActiveTab.boiler:
          isSelected = bc.boiler.activeTab == ActiveTab.boiler;
          disabled = bc.boiler.mode == BoilerMode.summer ||
              bc.boiler.mode == BoilerMode.weekly ||
              bc.boiler.mode == BoilerMode.custom;
          labelText = CU.displayValue(
            bc.boiler.pressure,
            presicion: 1,
            suffix: ValueSuffix.bar,
          );
          titleText = CU.displayValue(
            bc.boiler.currentBoilerWater,
            presicion: 0,
            suffix: ValueSuffix.celcius,
          );
          image = CU.image('radiator.png', w: 55, h: 40);
          break;
        case ActiveTab.hotWater:
          isSelected = bc.boiler.activeTab == ActiveTab.hotWater;
          disabled = false;
          labelText = 'hot water';
          titleText = CU.displayValue(
            bc.boiler.currentHotWater,
            presicion: 0,
            suffix: ValueSuffix.celcius,
          );
          image = CU.image('faucet.png', w: 49, h: 37);
          break;
        case ActiveTab.setValue:
          isSelected = bc.boiler.activeTab == ActiveTab.setValue;
          disabled = bc.boiler.mode == BoilerMode.summer ||
              bc.boiler.mode == BoilerMode.weekly ||
              bc.boiler.mode == BoilerMode.custom;
          labelText = 'average';
          titleText = CU.displayValue(
            bc.boiler.averageRoomTemperature,
            presicion: 1,
            suffix: ValueSuffix.celcius,
          );
          image = CU.image('set_icon.png', w: 36, h: 38);
          break;
      }

      if (isSelected) {
        color1 = Colors.black.withOpacity(0.4);
        color2 = Colors.black.withOpacity(0.6);
      }
      if (disabled) {
        color1 = Colors.black.withOpacity(0.2);
        color2 = Colors.black.withOpacity(0.2);
      }
      return Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(
            left: CU.toLogical(25),
            right: CU.toLogical(67),
          ),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: InkWell(
            onTap: disabled ? null : () => bc.setActiveTab(itemType),
            child: Opacity(
              opacity: disabled
                  ? 0.2
                  : isSelected
                      ? 1
                      : 0.7,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Opacity(
                          opacity: 0.7,
                          child: Text(
                            labelText,
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: CU.toLogical(14),
                              fontWeight: FontWeight.w100,
                              height: 1,
                            ),
                          ),
                        ),
                        Text(
                          titleText,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: CU.toLogical(22),
                            fontWeight: FontWeight.w300,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: CU.toLogical(11)),
                  image,
                  SizedBox(width: CU.toLogical(11)),
                  if (isSelected)
                    Icon(
                      Icons.chevron_right,
                      size: CU.toLogical(16),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
