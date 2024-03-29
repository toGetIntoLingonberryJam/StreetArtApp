import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:street_art_witnesses/core/values/constants.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.width = double.infinity,
    this.height = 100,
    this.borderRadius = kContainerRadius,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.onBackground,
      highlightColor: Theme.of(context).colorScheme.onSurface,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
