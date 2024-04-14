import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.isPrimary,
    this.label,
    this.child,
  }) : assert((child != null && label == null) || (child == null && label != null),
            'You must provide either label or child widget');

  const AppButton.primary({
    super.key,
    required this.onTap,
    this.label,
    this.child,
  })  : isPrimary = true,
        assert((child != null && label == null) || (child == null && label != null),
            'You must provide either label or child widget');

  const AppButton.secondary({
    super.key,
    required this.onTap,
    this.label,
    this.child,
  })  : isPrimary = false,
        assert((child != null && label == null) || (child == null && label != null),
            'You must provide either label or child widget');

  final String? label;
  final Widget? child;
  final VoidCallback? onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final btnColor = isPrimary ? colorScheme.primary : colorScheme.onBackground;

    return Material(
      borderRadius: kButtonBorderRadius,
      child: InkWell(
        splashColor: colorScheme.primary.withAlpha(40),
        borderRadius: kButtonBorderRadius,
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          padding: kContainerPadding,
          decoration: BoxDecoration(borderRadius: kButtonBorderRadius, color: btnColor),
          child: child ?? Text(label ?? '', style: TextStyles.button, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
