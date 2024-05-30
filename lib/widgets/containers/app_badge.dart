import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class AppBadge extends StatelessWidget {
  const AppBadge(this.label, {super.key, this.color});

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? context.colors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: NewTextStyles.footnoteSemibold),
    );
  }
}
