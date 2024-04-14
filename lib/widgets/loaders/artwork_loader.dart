import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ArtworkLoader extends StatelessWidget {
  const ArtworkLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: ''),
      body: ListView(
        padding: kDensePagePadding,
        children: const [
          Skeleton(height: 400),
          SizedBox(height: Paddings.small),
          Skeleton(height: 96),
          SizedBox(height: Paddings.small),
          Skeleton(height: 50, borderRadius: kContainerRadius),
          SizedBox(height: Paddings.small),
          Skeleton(height: 70),
          SizedBox(height: Paddings.small),
          Skeleton(height: 300),
        ],
      ),
    );
  }
}
