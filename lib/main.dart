import 'dart:io';

import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  runApp(const MainApp());

  // apply window options
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 480),
    // center: true,
    backgroundColor: Colors.black,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GPIOconfig config;
  late GPIO gpio;
  late GPIO gpio2;
  late GPIO gpio3;

  @override
  void initState() {
    super.initState();
    config = GPIOconfig.defaultValues();
    config.direction = GPIOdirection.gpioDirOut;

    gpio = GPIO(18, GPIOdirection.gpioDirOut);
    gpio2 = GPIO(16, GPIOdirection.gpioDirOut);
    gpio3 = GPIO.advanced(5, config);
  }

  @override
  void dispose() {
    gpio.dispose();
    gpio2.dispose();
    gpio3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPIO'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              for (var i = 0; i < 10; i++) {
                gpio.write(true);
                gpio2.write(true);
                gpio3.write(true);
                sleep(const Duration(milliseconds: 200));
                gpio.write(false);
                gpio2.write(false);
                gpio3.write(false);
                sleep(const Duration(milliseconds: 200));
              }
            },
            child: const Text('test'),
          ),
        ],
      ),
    );
  }
}
