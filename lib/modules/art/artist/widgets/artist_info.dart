import 'package:flutter/material.dart';
import 'package:street_art_ui_kit/street_art_ui_kit.dart';

class ArtistInfoCard extends StatelessWidget {
  const ArtistInfoCard({super.key, required this.artistName});

  final String artistName;

  @override
  Widget build(BuildContext context) {
    return SAContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(artistName, style: SATextStyles.headline1),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
