import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    this.bgColor,
    this.image,
    this.radius = 12,
  });

  final double radius;
  final Color? bgColor;
  final ImageProvider<Object>? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      foregroundImage: image,
      backgroundColor: bgColor ?? UIColors.slider,
    );
  }
}

class AppMarkerAvatar extends StatelessWidget {
  const AppMarkerAvatar({
    super.key,
    this.bgColor,
    this.image,
    this.child,
    this.radius = 12,
  }) : assert(image == null || child == null);

  final double radius;
  final Color? bgColor;
  final ImageProvider<Object>? image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor ?? UIColors.purple,
      radius: radius + 0.5,
      child: CircleAvatar(
        radius: radius,
        foregroundImage: image,
        backgroundColor: Colors.transparent,
        child: child,
      ),
    );
  }
}
