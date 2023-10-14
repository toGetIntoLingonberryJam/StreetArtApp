import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/intro/intro_slider.dart';
import 'package:street_art_witnesses/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreetArt Witnesses',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const IntroSlider(),
    );
  }
}
