import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/enums.dart';

class CU {
  static String displayValue(int t,
      {int presicion = 1, ValueSuffix suffix = ValueSuffix.celcius}) {
    return "${(t / 10).toStringAsFixed(presicion)}${suffix == ValueSuffix.bar ? ' bar' : suffix == ValueSuffix.celcius ? ' °C' : ''}";
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
}
