import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/widgets/content.dart';
import 'package:pi01/app/ui/widgets/date.dart';
import 'package:pi01/app/ui/widgets/saver_date.dart';
import 'package:pi01/app/ui/widgets/saver_flame.dart';
import 'package:pi01/app/ui/widgets/saver_mode.dart';
import 'package:pi01/app/ui/widgets/saver_room.dart';

class ScreenSaverScreen extends StatelessWidget {
  const ScreenSaverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: CircleContentWidget(
        child: Stack(
          children: [
            // Center(
            //   child: CU.image('draft_saver.png', w: 720, h: 720),
            // ),
            ScreenSaverDateWidget(),
            ScreenSaverFlame(),
            ScreenSaverMode(),
            SaverRoomTemperatureWidget(),
          ],
        ),
      ),
    );
  }
}
