import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/dimens.dart';

class CircleContentWidget extends StatelessWidget {
  const CircleContentWidget({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: UiDimens.screenSize,
          height: UiDimens.screenSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: child,
        ),
      ),
    );
  }
}
