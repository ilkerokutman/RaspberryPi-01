import 'package:get/get.dart';
import 'package:pi01/app/data/routes/routes.dart';
import 'package:pi01/app/ui/screens/main.dart';

List<GetPage> getPages = [
  // GetPage(
  //   name: Routes.home,
  //   page: () => const HomeScreen(),
  //   transition: Transition.size,
  //   curve: Curves.easeInExpo,
  //   transitionDuration: Duration(milliseconds: 1600),
  // ),
  // GetPage(name: Routes.weather, page: () => const WeatherScreen()),
  // GetPage(name: Routes.weeklyPlan, page: () => const WeeklyPlanScreen()),
  // GetPage(name: Routes.screenSaver, page: () => const ScreenSaverScreen()),
  // GetPage(name: Routes.settings, page: () => const SettingsScreen()),
  // GetPage(
  //   name: Routes.powerOff,
  //   page: () => const PowerOffScreen(),
  // ),

  GetPage(name: Routes.home, page: () => MainScreen()),
];
