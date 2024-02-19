import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/core/utils/common.dart';

class DemoLabelWidget extends StatelessWidget {
  const DemoLabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CU.toLogical(87),
      height: CU.toLogical(20),
      margin: EdgeInsets.only(bottom: CU.toLogical(13)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CU.toLogical(15)),
        color: Color.fromRGBO(209, 0, 47, 1),
      ),
      child: Center(
        child: Text(
          'DEMO MODE',
          style: TextStyle(
            fontSize: CU.toLogical(10),
            fontWeight: FontWeight.w300,
            height: 1,
          ),
        ),
      ),
    );
  }
}
