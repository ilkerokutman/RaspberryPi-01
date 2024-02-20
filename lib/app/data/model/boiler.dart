import 'package:pi01/app/core/constants/enums.dart';

class Boiler {
  BoilerMode mode;
  ActiveTab activeTab;
  FlameStatus flameStatus;
  int currentHotWater;
  int desiredHotWater;
  int currentBoilerWater;
  int desiredBoilerWater;
  int desiredRoomTemperature;
  int currentRoom1Temperature;
  int currentRoom2Temperature;
  int currentRoom3Temperature;
  bool room1Active;
  bool room2Active;
  bool room3Active;
  int pressure;

  Boiler({
    required this.mode,
    required this.activeTab,
    required this.flameStatus,
    required this.currentBoilerWater,
    required this.currentHotWater,
    required this.currentRoom1Temperature,
    required this.currentRoom2Temperature,
    required this.currentRoom3Temperature,
    required this.desiredBoilerWater,
    required this.desiredHotWater,
    required this.desiredRoomTemperature,
    required this.room1Active,
    required this.room2Active,
    required this.room3Active,
    required this.pressure,
  });

  int get averageRoomTemperature {
    List<int> temps = [];
    if (room1Active) temps.add(currentRoom1Temperature);
    if (room2Active) temps.add(currentRoom2Temperature);
    if (room3Active) temps.add(currentRoom3Temperature);
    if (temps.isEmpty) {
      temps.add(currentRoom1Temperature);
      temps.add(currentRoom2Temperature);
      temps.add(currentRoom3Temperature);
    }
    int total = 0;
    for (int i = 0; i < temps.length; i++) {
      total += temps[i];
    }
    int avg = (total / temps.length).toInt();
    return avg;
  }
}
