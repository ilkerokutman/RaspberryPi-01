import 'package:pi01/app/core/constants/enums.dart';

class Boiler {
  BoilerStatus boilerStatus;
  BoilerMode boilerMode;
  FlameStatus flameStatus;
  int boilerTemperature;
  int domesticWaterTemperature;
  int currentRoom1Temperature;
  int currentRoom2Temperature;
  int currentRoom3Temperature;
  int desiredRoomTemperature;
  int pressure;
  Boiler({
    required this.boilerStatus,
    required this.boilerMode,
    required this.flameStatus,
    required this.boilerTemperature,
    required this.domesticWaterTemperature,
    required this.currentRoom1Temperature,
    required this.currentRoom2Temperature,
    required this.currentRoom3Temperature,
    required this.desiredRoomTemperature,
    required this.pressure,
  });
}
