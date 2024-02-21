import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/utils/common.dart';
import 'package:pi01/app/ui/widgets/content.dart';

class ErrorDescriptionScreen extends StatelessWidget {
  const ErrorDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
          ),
          Center(
            child: SizedBox(
              width: CU.toLogical(320),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "E10 - LOW WATER PRESSURE",
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: CU.toLogical(22),
                      fontWeight: FontWeight.w300,
                      height: 1.25,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: CU.toLogical(20)),
                    child: Text(
                      'There is a water booster tap under the boiler to pump water into the boiler. If you look under the boiler, you can see this tap. If you turn the tap counterclockwise, you will notice that the boiler pressure increases. Close the tap when the boiler pressure reaches the ideal level of 1.5 - 2 bars.',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: CU.toLogical(14),
                        fontWeight: FontWeight.w100,
                        height: 1.2,
                      ),
                    ),
                  ),
                  CU.image('qr.png', w: 200, h: 200),
                  Padding(
                    padding: EdgeInsets.all(CU.toLogical(20)),
                    child: Text(
                      'Scan QR for details',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: CU.toLogical(14),
                        fontWeight: FontWeight.w100,
                        height: 1.1,
                      ),
                    ),
                  ),
                  FloatingActionButton.small(
                    heroTag: 'close-error-description',
                    backgroundColor: Colors.white.withOpacity(0.9),
                    onPressed: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
