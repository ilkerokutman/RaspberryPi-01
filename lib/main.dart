import 'package:flutter/material.dart';
import 'package:pi01/app/app.dart';
import 'package:pi01/app/data/services/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppBindings().dependencies();

  runApp(const MainApp());
}
