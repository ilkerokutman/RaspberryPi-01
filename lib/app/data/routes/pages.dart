import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi01/app/data/routes/routes.dart';
import 'package:pi01/app/ui/screens/error.dart';
import 'package:pi01/app/ui/screens/error_description.dart';
import 'package:pi01/app/ui/screens/main.dart';
import 'package:pi01/app/ui/screens/saver.dart';

List<GetPage> getPages = [
  GetPage(name: Routes.home, page: () => const MainScreen()),
  GetPage(
    name: Routes.saver,
    page: () => const ScreenSaverScreen(),
    transition: Transition.circularReveal,
    curve: Curves.easeInExpo,
    transitionDuration: const Duration(milliseconds: 1600),
  ),
  GetPage(
    name: Routes.error,
    page: () => const ErrorScreen(),
    transition: Transition.zoom,
    curve: Curves.easeOutExpo,
    transitionDuration: const Duration(milliseconds: 800),
  ),
  GetPage(
    name: Routes.errorDescription,
    page: () => const ErrorDescriptionScreen(),
    transition: Transition.zoom,
    curve: Curves.easeOutExpo,
    transitionDuration: const Duration(milliseconds: 800),
  ),
];
