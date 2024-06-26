import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.borderRadius = kContainerRadius,
    this.color,
  });

  final Widget child;
  final double borderRadius;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: width,
        padding: kContainerPadding,
        decoration: BoxDecoration(
          color: color ?? UIColors.backgroundCard,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
