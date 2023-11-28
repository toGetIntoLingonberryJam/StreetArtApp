import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton.filled({
    super.key,
    required this.onTap,
    this.isFilled = true,
    this.text,
  });

  const AppTextButton.outlined({
    super.key,
    required this.onTap,
    this.isFilled = false,
    this.text,
  });

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
        padding: isFilled
            ? kContainerPadding
            : const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: kButtonBorderRadius,
          color: isFilled ? colorScheme.primary : colorScheme.onBackground,
          border: isFilled
              ? null
              : Border.all(color: colorScheme.primary, width: 2),
        ),
        child: Text(
          text ?? '',
          style: isFilled ? style?.copyWith(color: Colors.black) : style,
        ),
      ),
    );
  }
}
