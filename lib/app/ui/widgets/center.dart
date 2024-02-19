import 'package:flutter/material.dart';
import 'package:pi01/app/core/utils/common.dart';

class CenterDisplayWidget extends StatelessWidget {
  const CenterDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CU.image('center_bg.png', w: 320, h: 320),
    );
  }
}
