import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    //primarySwatch: MaterialColor(primary, swatch),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
      titleSmall: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
      bodyMedium: TextStyle(fontSize: 18),
    ),
  );
}
