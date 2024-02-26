import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ArtworkInfo extends StatelessWidget {
  const ArtworkInfo({super.key, required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ArtistInfo(artwork.artistId),
          const SizedBox(height: 4),
          Text(artwork.title, style: TextStyles.headline1),
          const SizedBox(height: 8),
          Text('${artwork.yearCreated ?? 'Год неизвестен'}', style: TextStyles.caption),
        ],
      ),
    );
  }
}

class _ArtistInfo extends StatelessWidget {
  const _ArtistInfo(this.artistId);

  final int? artistId;

  @override
  Widget build(BuildContext context) {
    if (artistId == null) {
      return const Text(
        'Автор неизвестен',
        style: TextStyles.headline2,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCircleAvatar(image: AppPlaceholder.assetImage()),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'Artist Id: $artistId',
            style: TextStyles.headline2,
          ),
        ),
      ],
    );
  }
}
