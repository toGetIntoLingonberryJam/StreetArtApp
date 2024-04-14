import 'package:flutter/material.dart';

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
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: colorScheme.inversePrimary.withAlpha(40),
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: colorScheme.surfaceVariant,
          ),
          child: Icon(
            iconData,
            color: colorScheme.inverseSurface,
            size: 28,
          ),
        ),
      ),
    );
  }
}
