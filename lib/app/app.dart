import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pi01/app/data/routes/pages.dart';
import 'package:pi01/app/data/routes/routes.dart';
import 'package:pi01/app/data/services/bindings.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home,
      initialBinding: AppBindings(),
      getPages: getPages,
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        textTheme:
            Theme.of(context).textTheme.apply(fontFamily: 'SF Pro Display'),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
    );
  }
}
