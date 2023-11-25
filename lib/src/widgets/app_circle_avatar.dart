import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    this.bgColor,
    this.image,
    this.radius = 12,
  });

  final Color? bgColor;
  final ImageProvider<Object>? image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: bgColor ?? Theme.of(context).colorScheme.secondary,
      foregroundImage: image,
    );
  }
}
