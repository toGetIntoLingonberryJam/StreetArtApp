import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.value, this.color});

  final double? value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      color: color ?? Theme.of(context).colorScheme.primary,
      strokeWidth: 8,
      strokeCap: StrokeCap.round,
    );
  }
}
