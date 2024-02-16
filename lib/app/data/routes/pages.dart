import 'package:get/get.dart';
import 'package:pi01/app/data/routes/routes.dart';
import 'package:pi01/app/ui/home/home.dart';
import 'package:pi01/app/ui/power_off/power_off.dart';
import 'package:pi01/app/ui/screen_saver/screen_saver.dart';
import 'package:pi01/app/ui/settings/settings.dart';
import 'package:pi01/app/ui/weather/weather.dart';
import 'package:pi01/app/ui/weekly_plan/weekly_plan.dart';

List<GetPage> getPages = [
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.weather, page: () => const WeatherScreen()),
  GetPage(name: Routes.weeklyPlan, page: () => const WeeklyPlanScreen()),
  GetPage(name: Routes.screenSaver, page: () => const ScreenSaverScreen()),
  GetPage(name: Routes.settings, page: () => const SettingsScreen()),
  GetPage(name: Routes.powerOff, page: () => const PowerOffScreen()),
];
