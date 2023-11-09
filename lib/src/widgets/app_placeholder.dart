import 'package:flutter/material.dart';

class AppPlaceholder extends StatelessWidget {
  const AppPlaceholder({super.key});

  static AssetImage assetImage() => const AssetImage('assets/placeholder.png');

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/placeholder.png',
      fit: BoxFit.cover,
    );
  }
}
