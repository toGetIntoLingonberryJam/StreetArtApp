import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  final double width = 128;
  final double height = 128;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_light.png', width: width, height: height);
  }
}
