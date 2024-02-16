import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pi01/app/ui/widgets/content.dart';

class PowerOffScreen extends StatelessWidget {
  const PowerOffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContentWidget(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: SvgPicture.asset(
                'assets/images/logo_dark.svg',
                key: Key('logo'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
