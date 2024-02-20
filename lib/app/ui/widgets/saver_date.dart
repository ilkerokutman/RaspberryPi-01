import 'package:flutter/material.dart';
import 'package:pi01/app/core/utils/common.dart';

class ScreenSaverDateWidget extends StatelessWidget {
  const ScreenSaverDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: CU.toLogical(50),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "21:24",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: CU.toLogical(68),
                fontWeight: FontWeight.w100,
                color: Colors.white.withOpacity(0.7),
                height: 1.1,
              ),
            ),
            Text(
              'Saturday February 17',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: CU.toLogical(18),
                fontWeight: FontWeight.w100,
                color: Colors.white.withOpacity(0.7),
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
