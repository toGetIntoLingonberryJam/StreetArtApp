import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton.primary({
    super.key,
    required this.onTap,
    this.label,
    this.child,
  })  : isPrimary = true,
        assert((child != null && label == null) || (child == null && label != null));

  const AppButton.secondary({
    super.key,
    required this.onTap,
    this.label,
    this.child,
  })  : isPrimary = false,
        assert((child != null && label == null) || (child == null && label != null));

  final String? label;
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
          foregroundColor: isPrimary ? Colors.black : Theme.of(context).colorScheme.inverseSurface,
          textStyle: TextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: kButtonBorderRadius,
          )),
      onPressed: onTap,
      child: child ?? Text(label!, style: TextStyles.button),
    );
  }
}
