import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: UIColors.textPrimary.withAlpha(40),
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: UIColors.greyButton,
          ),
          child: Icon(
            iconData,
            color: UIColors.textPrimary,
            size: 28,
          ),
        ),
      ),
    );
  }
}
