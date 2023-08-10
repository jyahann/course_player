import 'package:course_player/app_config/styles.dart';
import 'package:course_player/src/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}
