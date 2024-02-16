import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/data/model/boiler.dart';
import 'package:pi01/app/data/model/weather.dart';

class UiData {
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
    boilerMode: BoilerMode.winter,
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
