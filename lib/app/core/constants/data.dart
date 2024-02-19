import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/data/model/boiler.dart';
import 'package:pi01/app/data/model/weather.dart';

class UiData {
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

  static Weather weather = Weather(
    currentTemperature: 110,
    minTemperature: 90,
    maxTemperature: 140,
    humidity: 90,
    windSpeed: 41,
    windDirection: 90,
    weatherStatus: WeatherStatus.rain,
  );

  static Boiler boiler = Boiler(
    boilerStatus: BoilerStatus.on,
    boilerMode: BoilerMode.off,
    flameStatus: FlameStatus.on,
    boilerTemperature: 650,
    domesticWaterTemperature: 450,
    currentRoom1Temperature: 192,
    currentRoom2Temperature: 208,
    currentRoom3Temperature: 211,
    desiredRoomTemperature: 220,
    pressure: 11,
  );
}
