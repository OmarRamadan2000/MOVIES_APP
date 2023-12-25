import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.secondary,
    //primarySwatch: MaterialColor(primary, swatch),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
      titleSmall: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
      bodyMedium: TextStyle(fontSize: 18),
    ),
  );
}
