import 'package:flutter/material.dart';

class AppPlaceholder extends StatelessWidget {
  const AppPlaceholder({super.key, this.width, this.height});

  final double? width;
  final double? height;

  static AssetImage assetImage() => const AssetImage('assets/placeholder.png');

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/placeholder.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
