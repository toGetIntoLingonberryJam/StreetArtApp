import 'package:flutter/material.dart';

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
    return Center(
      child: Wrap(
        runSpacing: gap,
        spacing: gap,
        alignment: WrapAlignment.center,
        children: [
          for (int i = 0; i < count; i++)
            Dot(radius: 10, isActive: i == activeIndex),
        ],
      ),
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
        color: isActive
            ? Theme.of(context).colorScheme.inverseSurface
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular((radius)),
      ),
    );
  }
}
