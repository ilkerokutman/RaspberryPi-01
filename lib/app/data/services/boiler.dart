import 'package:get/get.dart';
import 'package:pi01/app/core/constants/data.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/data/model/boiler.dart';
import 'package:pi01/app/data/model/weather.dart';

class BoilerController extends GetxController {
  final Rx<Boiler> _boiler = UiData.boiler.obs;
  Boiler get boiler => _boiler.value;
  void setBoiler(Boiler b) {
    _boiler.value = b;
    update();
  }

  final Rx<Weather> _weather = UiData.weather.obs;
  Weather get weather => _weather.value;
  void setWeather(Weather w) {
    _weather.value = w;
    update();
  }

  void togglePower() {
    Boiler b = boiler;
    b.boilerStatus =
        b.boilerStatus == BoilerStatus.off ? BoilerStatus.on : BoilerStatus.off;
    setBoiler(b);
  }

  void setMode(BoilerMode m) {
    Boiler b = boiler;
    b.boilerMode = m;
    setBoiler(b);
  }

  final RxBool _screenSaverActive = false.obs;
  bool get screenSaverActive => _screenSaverActive.value;

  void increaseBoilerTemperature() {
    Boiler b = boiler;
    b.boilerTemperature = b.boilerTemperature + 10;
    setBoiler(b);
  }

  void decreaseBoilerTemperature() {
    Boiler b = boiler;
    b.boilerTemperature = b.boilerTemperature - 10;
    setBoiler(b);
  }

  void increaseWaterTemperature() {
    Boiler b = boiler;
    b.domesticWaterTemperature = b.domesticWaterTemperature + 10;
    setBoiler(b);
  }

  void decreaseWaterTemperature() {
    Boiler b = boiler;
    b.domesticWaterTemperature = b.domesticWaterTemperature - 10;
    setBoiler(b);
  }

  void setRoomTemperature(int t) {
    Boiler b = boiler;
    b.desiredRoomTemperature = t;
    setBoiler(b);
  }
}
