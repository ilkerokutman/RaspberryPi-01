import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';

class SaverRoomTemperatureWidget extends StatelessWidget {
  const SaverRoomTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(
      builder: (bc) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
              bottom: CU.toLogical(71),
            ),
            width: CU.toLogical(324),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                saverRoomDisplayWidget(
                    'LIVING ROOM', bc.boiler.currentRoom1Temperature),
                saverRoomDisplayWidget(
                    'BEDROOM', bc.boiler.currentRoom2Temperature),
                saverRoomDisplayWidget(
                    'KITCHEN', bc.boiler.currentRoom3Temperature),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget saverRoomDisplayWidget(String name, int temperature) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CU.toLogical(12),
            fontWeight: FontWeight.w100,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        Text(
          CU.displayValue(
            temperature,
            presicion: 1,
            suffix: ValueSuffix.celcius,
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CU.toLogical(26),
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.86),
          ),
        ),
      ],
    );
  }
}
