import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ArtworkLoader extends StatelessWidget {
  const ArtworkLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            Skeleton(height: 380),
            SizedBox(height: 10),
            Skeleton(height: 100),
            SizedBox(height: 8),
            Skeleton(height: 50, borderRadius: kContainerRadius),
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
