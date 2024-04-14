import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';

class SliderDots extends StatelessWidget {
  const SliderDots({
    super.key,
    required this.count,
    required this.activeIndex,
    this.gap = 8,
  });

  final int count;
  final int activeIndex;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: gap,
      spacing: gap,
      alignment: WrapAlignment.center,
      children: [
        for (int i = 0; i < count; i++) Dot(radius: 8, isActive: i == activeIndex),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    required this.radius,
    required this.isActive,
  });

  final double radius;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: isActive ? UIColors.textPrimary : UIColors.slider,
        borderRadius: BorderRadius.circular((radius)),
      ),
    );
  }
}
