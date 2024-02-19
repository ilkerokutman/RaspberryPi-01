import 'package:flutter/material.dart';
import 'package:pi01/app/core/utils/common.dart';

class DateTimeDisplayWidget extends StatelessWidget {
  const DateTimeDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -1),
      child: Container(
        margin: EdgeInsets.only(top: CU.toLogical(30)),
        width: CU.toLogical(380),
        height: CU.toLogical(85),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CU.image('link.png', w: 23, h: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "21:24",
                        style: TextStyle(
                          fontSize: CU.toLogical(42),
                        ),
                      ),
                      Text(
                        "Saturday, February 17",
                        style: TextStyle(
                          fontSize: CU.toLogical(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  CU.image('wifi.png', w: 23, h: 16),
                ],
              ),
            ),
            Container(
              height: CU.toLogical(1),
              width: double.infinity,
              color: Colors.white.withOpacity(0.1),
            )
          ],
        ),
      ),
    );
  }
}
