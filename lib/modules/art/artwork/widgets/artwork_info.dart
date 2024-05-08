import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/providers/artists_provider.dart';
import 'package:street_art_witnesses/modules/art/artist/screen.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/containers/app_badge.dart';
import 'package:street_art_witnesses/widgets/loaders.dart';

class ArtworkInfo extends StatelessWidget {
  const ArtworkInfo({super.key, required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ArtistInfo(artwork.artistPreview),
          const SizedBox(height: Paddings.small),
          Text(artwork.title, style: NewTextStyles.title3Regular),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Год создания: ${artwork.yearCreated ?? 'неизвестен'}',
                  style: NewTextStyles.bodyRegular.copyWith(color: UIColors.textSecondary),
                ),
              ),
              AppBadge(artwork.status.label),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArtistInfo extends StatelessWidget {
  const _ArtistInfo(this.artist);

  final ArtistPreview? artist;

  @override
  Widget build(BuildContext context) {
    if (artist == null) {
      return const Text(
        'Автор неизвестен',
        style: NewTextStyles.bodyRegular,
      );
    }

    return GestureDetector(
      onTap: () => Get.to(() => Loader(
            future: ArtistsProvider.getArtistById(artist!.id),
            builder: (artist) => ArtistScreen(artist: artist),
            loader: Loaders.artist,
            onError: () => Get.back(),
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingImageCircleAvatar(imageUrl: artist?.previewUrl, radius: 10),
          const SizedBox(width: 8),
          Expanded(
            child: Text(artist!.name, style: NewTextStyles.bodyRegular),
          ),
        ],
      ),
    );
  }
}
