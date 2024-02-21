import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/routes/routes.dart';
import 'package:pi01/app/data/services/boiler.dart';

class DateTimeDisplayWidget extends StatelessWidget {
  const DateTimeDisplayWidget({
    super.key,
    this.hasLink = false,
  });
  final bool hasLink;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoilerController>(builder: (bc) {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: CU.toLogical(30)),
          width: CU.toLogical(350),
          height: CU.toLogical(90),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: hasLink
                          ? () async {
                              bc.cancelTimer();
                              await Get.toNamed(Routes.error);
                              bc.startTimer();
                            }
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: CU.image('link.png', w: 23, h: 18),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          CU.displayClock(bc.dateNow),
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: CU.toLogical(42),
                          ),
                        ),
                        Text(
                          CU.displayDate(bc.dateNow),
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: CU.toLogical(14),
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: hasLink
                          ? () async {
                              bc.cancelTimer();
                              await Get.toNamed(Routes.error);
                              bc.startTimer();
                            }
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: CU.image('wifi.png', w: 23, h: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: CU.toLogical(1),
                width: double.infinity,
                color: Colors.white.withOpacity(0.2),
              )
            ],
          ),
        ),
      );
    });
  }
}
