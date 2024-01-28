import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton.filled({
    super.key,
    required this.child,
    required this.onTap,
    this.isFilled = true,
  });

  const AppCustomButton.outlined({
    super.key,
    required this.child,
    required this.onTap,
    this.isFilled = false,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      splashColor: colorScheme.inversePrimary.withAlpha(40),
      borderRadius: kButtonBorderRadius,
      onTap: onTap,
      child: Ink(
        padding:
            isFilled ? kContainerPadding : const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: kButtonBorderRadius,
          color: isFilled ? colorScheme.primary : colorScheme.onBackground,
          border: isFilled ? null : Border.all(color: colorScheme.primary, width: 2),
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
