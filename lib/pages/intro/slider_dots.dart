import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {
  const SliderDots({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 50,
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < count; i++)
              Dot(radius: 10, isActive: i == activeIndex)
          ],
        ),
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
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular((radius)),
      ),
    );
  }
}
