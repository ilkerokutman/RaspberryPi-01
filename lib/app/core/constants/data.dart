import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/data/model/boiler.dart';
import 'package:pi01/app/ui/screens/home.dart';
import 'package:pi01/app/ui/screens/weather.dart';
import 'package:pi01/app/ui/screens/weekly.dart';

class UiData {
  static const screenSaverDuration = Duration(seconds: 120);

  static List<Widget> pagerTabs = [
    const WeeklyScreen(),
    const HomeScreen(),
    const WeatherScreen(),
  ];

  static List<String> roomNames = [
    'LIVING ROOM',
    'BEDROOM',
    'KITCHEN',
  ];

  static List<String> menuTitles = [
    'Summer Mode',
    'Winter Mode',
    'Eco Mode',
    'Weekly Plan',
    'Customized',
  ];

  static List<String> menuAssets = [
    't01_n.png',
    't02_n.png',
    't03_n.png',
    't04_n.png',
    't05_n.png',
  ];
  static List<String> menuAssetsActive = [
    't01_w.png',
    't02_w.png',
    't03_w.png',
    't04_w.png',
    't05_w.png',
  ];
  static List<String> menuAssetsBig = [
    't01_h.png',
    't02_h.png',
    't03_h.png',
    't04_h.png',
    't05_h.png',
  ];

  static Boiler boiler = Boiler(
    activeTab: ActiveTab.boiler,
    flameStatus: FlameStatus.on,
    mode: BoilerMode.winter,
    currentBoilerWater: 587,
    desiredBoilerWater: 600,
    currentHotWater: 463,
    desiredHotWater: 470,
    desiredRoomTemperature: 240,
    currentRoom1Temperature: 234,
    currentRoom2Temperature: 217,
    currentRoom3Temperature: 237,
    pressure: 18,
    room1Active: true,
    room2Active: true,
    room3Active: true,
  );
}
