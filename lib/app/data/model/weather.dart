import 'package:pi01/app/core/constants/enums.dart';

class Weather {
  int currentTemperature;
  int minTemperature;
  int maxTemperature;
  int humidity;
  int windSpeed;
  int windDirection;
  WeatherStatus weatherStatus;

  Weather({
    required this.currentTemperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.weatherStatus,
  });
}
