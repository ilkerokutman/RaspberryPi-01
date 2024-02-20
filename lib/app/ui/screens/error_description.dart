import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/ui/widgets/content.dart';

class ErrorDescriptionScreen extends StatelessWidget {
  const ErrorDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: Stack(
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              constraints: BoxConstraints.expand(),
            ),
          ),
          Center(
            child: Text("Error description here"),
          ),
        ],
      ),
    );
  }
}
