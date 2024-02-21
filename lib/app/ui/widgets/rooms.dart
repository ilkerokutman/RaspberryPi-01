import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/constants/data.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/services/boiler.dart';

class RoomInfoWidget extends StatelessWidget {
  const RoomInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(
      builder: (bc) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: CU.toLogical(100),
            height: CU.toLogical(300),
            margin: EdgeInsets.only(
              right: CU.toLogical(75),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Opacity(opacity: 0.24, child: Icon(Icons.expand_less)),
                room(UiData.roomNames[0], bc.boiler.currentRoom1Temperature,
                    bc.boiler.room1Active, () {
                  bc.onRoomClicked(1);
                }),
                room(UiData.roomNames[1], bc.boiler.currentRoom2Temperature,
                    bc.boiler.room2Active, () {
                  bc.onRoomClicked(2);
                }),
                room(UiData.roomNames[2], bc.boiler.currentRoom3Temperature,
                    bc.boiler.room3Active, () {
                  bc.onRoomClicked(3);
                }),
                const Opacity(opacity: 0.24, child: Icon(Icons.expand_more)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget room(
      String title, int degree, bool isActive, GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: CU.toLogical(5.5),
            backgroundColor: isActive
                ? const Color.fromRGBO(209, 0, 47, 1)
                : Colors.transparent,
          ),
          SizedBox(width: CU.toLogical(10)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: CU.toLogical(12),
                    fontWeight: FontWeight.w100,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                Text(
                  CU.displayValue(degree),
                  style: TextStyle(
                    fontSize: CU.toLogical(18),
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
