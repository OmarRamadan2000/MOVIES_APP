import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_themes.dart';
import 'package:movie_app/features/Movies/presentation/pages/home_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOVIE APP',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeMovie(),
    );
  }
}
