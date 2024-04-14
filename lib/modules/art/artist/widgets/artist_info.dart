import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ArtistInfoCard extends StatelessWidget {
  const ArtistInfoCard({super.key, required this.artistName});

  final String artistName;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(artistName, style: TextStyles.headline1),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
