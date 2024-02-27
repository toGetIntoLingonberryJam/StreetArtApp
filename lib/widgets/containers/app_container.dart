import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.borderRadius = kContainerRadius,
  });

  const AppContainer.small({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.borderRadius = kSmallContainerRadius,
  });

  final Widget child;
  final double borderRadius;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: width,
        padding: kContainerPadding,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
