import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/widgets/content.dart';
import 'package:pi01/app/ui/widgets/date.dart';
import 'package:pi01/app/ui/widgets/degree_tabs.dart';
import 'package:pi01/app/ui/widgets/error_center.dart';
import 'package:pi01/app/ui/widgets/mini_weather.dart';
import 'package:pi01/app/ui/widgets/mode_buttons.dart';
import 'package:pi01/app/ui/widgets/rooms.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: Stack(
        children: [
          CU.image('bg_error.png', w: 720, h: 720),
          const DateTimeDisplayWidget(),
          const MiniWeatherWidget(),
          const Opacity(opacity: 0.2, child: DegreeTabsWidget()),
          const Opacity(opacity: 0.2, child: RoomInfoWidget()),
          // const CenterDisplayWidget(),
          const Opacity(
            opacity: 0.2,
            child: ModeButtonsWidget(),
          ),
          // InkWell(
          //   onTap: () => Get.back(),
          //   child: Container(
          //     constraints: const BoxConstraints.expand(),
          //   ),
          // ),
          InkWell(
            onTap: null,
            child: Container(constraints: const BoxConstraints.expand()),
          ),
          const ErrorCenterWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: CU.toLogical(50),
              ),
              child: FloatingActionButton.small(
                heroTag: 'close-error',
                backgroundColor: Colors.white.withOpacity(0.9),
                onPressed: () => Get.back(),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Opacity(
          //   opacity: 0.3,
          //   child: Image.asset('assets/images/draft_error.png'),
          // )
        ],
      ),
    );
  }
}