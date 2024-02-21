import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/enums.dart';

class CU {
  static String displayValue(int t,
      {int presicion = 1, ValueSuffix suffix = ValueSuffix.celcius}) {
    return "${(t / 10).toStringAsFixed(presicion)}${suffix == ValueSuffix.bar ? ' bar' : suffix == ValueSuffix.celcius ? '°' : ''}";
  }

  static double toLogical(double size) {
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

    Size sp = view.physicalSize;
    double pw = sp.width;

    Size sl = view.physicalSize / view.devicePixelRatio;
    double lw = sl.width;

    return size * (lw / pw);
  }

  static Widget image(String name, {double? w, double? h}) {
    return SizedBox(
      width: w == null ? null : toLogical(w),
      height: h == null ? null : toLogical(h),
      child: Image.asset(
        'assets/images/$name',
        width: w == null ? null : toLogical(w),
        height: h == null ? null : toLogical(h),
        fit: BoxFit.contain,
      ),
    );
  }

  static String displayClock(DateTime d, {bool showSeconds = false}) {
    String hour = "0${d.hour}";
    hour = hour.length == 2 ? hour : hour.substring(1, 3);
    String minute = "0${d.minute}";
    minute = minute.length == 2 ? minute : minute.substring(1, 3);
    String second = "0${d.second}";
    second = second.length == 2 ? second : second.substring(1, 3);
    return showSeconds ? "$hour:$minute:$second" : "$hour:$minute";
  }

  static String displayDate(DateTime d) {
    return "${getMonthName(d.month)}, ${getWeekdayName(d.weekday)} ${d.day}";
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  static String getWeekdayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
}
