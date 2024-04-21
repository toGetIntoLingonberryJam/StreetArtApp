import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class LinkButton extends StatelessWidget {
  const LinkButton(this.label, {super.key, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyles.text.copyWith(
          fontWeight: FontWeight.w500,
          color: UIColors.accent,
          decoration: TextDecoration.underline,
          decorationColor: UIColors.accent,
        ),
      ),
    );
  }
}
