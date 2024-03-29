import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/dimens.dart';

class CircleContentWidget extends StatelessWidget {
  const CircleContentWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: UiDimens.screenSize,
          height: UiDimens.screenSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).canvasColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
