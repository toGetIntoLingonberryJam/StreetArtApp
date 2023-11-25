import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/src/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/src/widgets/skeletons/app_placeholder.dart';

class ArtworkInfo extends StatelessWidget {
  const ArtworkInfo({super.key, required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppCircleAvatar(radius: 8, image: AppPlaceholder.assetImage()),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Artist Id: ${artwork.artistId}',
                  style: TextStyles.headlines.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(artwork.title, style: TextStyles.titles.w700),
          const SizedBox(height: 8),
          Text('${artwork.yearCreated}', style: TextStyles.captions.w400),
        ],
      ),
    );
  }
}
