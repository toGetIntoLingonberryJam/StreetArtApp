import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.value, this.color});

  final double? value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      color: color ?? UIColors.accent,
      strokeWidth: 4,
      strokeCap: StrokeCap.round,
    );
  }
}
