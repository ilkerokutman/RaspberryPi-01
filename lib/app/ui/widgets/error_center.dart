import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/data/routes/routes.dart';

class ErrorCenterWidget extends StatelessWidget {
  const ErrorCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(top: CU.toLogical(90)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(
                    //   'E10',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: CU.toLogical(28),
                    //     fontWeight: FontWeight.w500,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // Text(
                    //   'LOW WATER PRESSURE',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: CU.toLogical(12),
                    //     fontWeight: FontWeight.w100,
                    //     color: Colors.white,
                    //     height: 1.1,
                    //   ),
                    // ),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.errorDescription),
                      child: CU.image(
                        'error_description.png',
                        w: 132,
                        h: 148,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
