import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ArtworkSkeleton extends StatelessWidget {
  const ArtworkSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDensePagePadding,
        child: ListView(
          children: const [
            Skeleton(height: 380),
            SizedBox(height: 10),
            SliderDots(count: 4, activeIndex: 0),
            SizedBox(height: 10),
            Skeleton(height: 100),
            SizedBox(height: 8),
            Skeleton(height: 50, borderRadius: kSmallContainerRadius),
            SizedBox(height: 8),
            Skeleton(height: 70),
            SizedBox(height: 8),
            Skeleton(height: 300),
          ],
        ),
      ),
    );
  }
}
