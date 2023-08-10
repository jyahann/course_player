import 'package:course_player/src/source_input/screens/source_input_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => SourceInputScreen(),
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: Image.asset("assets/bot.png"),
      ),
    );
  }
}
