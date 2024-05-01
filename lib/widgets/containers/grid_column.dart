import 'package:flutter/material.dart';

class GridColumn extends StatelessWidget {
  const GridColumn({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.widgetHeight,
    this.childAspectRatio = 1.0,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
    this.isScrollable = false,
  });

  final int itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final double? widgetHeight;
  final double childAspectRatio;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: childAspectRatio,
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        mainAxisExtent: widgetHeight,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
