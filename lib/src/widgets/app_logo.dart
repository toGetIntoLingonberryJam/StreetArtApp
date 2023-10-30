import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness theme = Theme.of(context).brightness;

    return Image.asset(theme == Brightness.dark
        ? 'assets/logo_light.png'
        : 'assets/logo_dark.png');
  }
}
