import 'package:flutter/material.dart';

class GridColumn extends StatelessWidget {
  const GridColumn({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.widgetHeight,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
  });

  final int itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final double? widgetHeight;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        mainAxisExtent: widgetHeight,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
