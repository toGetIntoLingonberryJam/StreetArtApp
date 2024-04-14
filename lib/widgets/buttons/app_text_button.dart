import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.onTap, required this.isFilled, this.text});

  const AppTextButton.filled({super.key, required this.onTap, this.text}) : isFilled = true;

  const AppTextButton.outlined({super.key, required this.onTap, this.text}) : isFilled = false;

  final String? text;
  final TextStyle? style = TextStyles.button;
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
        child: Text(text ?? '', style: style, textAlign: TextAlign.center),
      ),
    );
  }
}
