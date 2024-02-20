import 'dart:async';

import 'package:get/get.dart';
import 'package:pi01/app/core/constants/data.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/data/model/boiler.dart';
import 'package:pi01/app/data/routes/routes.dart';

class BoilerController extends GetxController {
  late Timer timer;

  @override
  void onReady() {
    super.onReady();
    startTimer();
  }

  final Rx<Boiler> _boiler = UiData.boiler.obs;
  Boiler get boiler => _boiler.value;
  void setBoiler(Boiler b) {
    _boiler.value = b;
    update();
    cancelTimer();
    startTimer();
  }

  void onMinusPressed() {
    Boiler b = boiler;
    switch (b.activeTab) {
      case ActiveTab.boiler:
        b.desiredBoilerWater -= 10;
        if (b.desiredBoilerWater < 250) {
          b.desiredBoilerWater = 250;
        }
        break;
      case ActiveTab.hotWater:
        b.desiredHotWater -= 10;
        if (b.desiredHotWater < 350) {
          b.desiredHotWater = 350;
        }
        break;
      case ActiveTab.setValue:
        b.desiredRoomTemperature -= 5;
        if (b.desiredRoomTemperature < 150) {
          b.desiredRoomTemperature = 150;
        }
        break;
    }
    setBoiler(b);
  }

  void onPlusPressed() {
    Boiler b = boiler;
    switch (b.activeTab) {
      case ActiveTab.boiler:
        b.desiredBoilerWater += 10;
        if (b.desiredBoilerWater > 850) {
          b.desiredBoilerWater = 850;
        }
        break;
      case ActiveTab.hotWater:
        b.desiredHotWater += 10;
        if (b.desiredHotWater > 650) {
          b.desiredHotWater = 650;
        }
        break;
      case ActiveTab.setValue:
        b.desiredRoomTemperature += 5;
        if (b.desiredRoomTemperature > 350) {
          b.desiredRoomTemperature = 350;
        }
        break;
    }
    setBoiler(b);
  }

  void setActiveTab(ActiveTab t) {
    Boiler b = boiler;
    b.activeTab = t;
    setBoiler(b);
  }

  void setMode(BoilerMode m) {
    Boiler b = boiler;
    b.mode = m;
    setBoiler(b);
    if (m == BoilerMode.summer || m == BoilerMode.weekly) {
      setActiveTab(ActiveTab.hotWater);
    }
  }

  void onRoomClicked(int i) {
    Boiler b = boiler;
    switch (i) {
      case 1:
        b.room1Active = !b.room1Active;
        break;
      case 2:
        b.room2Active = !b.room2Active;
        break;
      case 3:
        b.room3Active = !b.room3Active;
        break;
    }
    setBoiler(b);
  }

  void cancelTimer() {
    try {
      timer.cancel();
    } on Exception catch (_) {}
  }

  void startTimer() async {
    const duration = Duration(seconds: 20);

    timer = Timer(
      duration,
      () async {
        await Get.toNamed(Routes.saver);
        startTimer();
      },
    );
  }
}
