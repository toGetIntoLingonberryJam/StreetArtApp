import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton.primary({
    super.key,
    required this.text,
    required this.onTap,
  }) : isPrimary = true;

  const AppButton.secondary({
    super.key,
    required this.text,
    required this.onTap,
  }) : isPrimary = false;

  final String text;
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
      child: Text(text, style: TextStyles.button),
    );
  }
}
