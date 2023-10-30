import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton.primary({
    super.key,
    required this.child,
    required this.onTap,
    this.isPrimary = true,
  });

  const AppButton.secondary({
    super.key,
    required this.child,
    required this.onTap,
    this.isPrimary = false,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          backgroundColor: isPrimary
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground,
          foregroundColor: isPrimary
              ? Colors.black
              : Theme.of(context).colorScheme.inverseSurface,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: kButtonBorderRadius,
          )),
      onPressed: onTap,
      child: child,
    );
  }
}
