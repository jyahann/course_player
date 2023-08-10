import 'package:course_player/app_config/colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: backgroundColor,
  backgroundColor: backgroundColor,
  primaryColor: primaryColor,
  textTheme: const TextTheme(
    button: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
  ),
);
