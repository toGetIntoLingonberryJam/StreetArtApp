import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/extensions.dart';
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
import 'package:street_art_witnesses/widgets/mbs.dart';

class ArtworkInfo extends StatelessWidget {
  const ArtworkInfo({super.key, required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (artwork.artistPreviews == null || artwork.artistPreviews!.isEmpty || artwork.artistPreviews!.length == 1)
            _ArtistInfo(artwork.artistPreviews?.firstOrNull)
          else
            _MultiArtistsInfo(artwork.artistPreviews!),
          const SizedBox(height: Paddings.small),
          Text(artwork.title, style: NewTextStyles.title2Semibold),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Год создания: ${artwork.yearCreated ?? 'неизвестен'}',
                  style: NewTextStyles.subheadMedium.copyWith(color: UIColors.textSecondary),
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
      return const Text('Автор неизвестен', style: NewTextStyles.bodyRegular);
    }

    return GestureDetector(
      onTap: () => openScreen(Loader(
        future: ArtistsProvider.getArtistById(artist!.id),
        builder: (artist) => ArtistScreen(artist: artist),
        loader: Loaders.artist,
        onError: () => closeScreen,
      )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingImageCircleAvatar(imageUrl: artist?.image?.imageUrl, radius: 10),
          const SizedBox(width: 8),
          Expanded(child: Text(artist!.name, style: NewTextStyles.bodyRegular)),
        ],
      ),
    );
  }
}

class _MultiArtistsInfo extends StatelessWidget {
  const _MultiArtistsInfo(this.artists);

  final List<ArtistPreview> artists;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final artist = await ArtMbs.showArtistsPicker(context, artists);
        if (artist != null) {
          openScreen(Loader(
            future: ArtistsProvider.getArtistById(artist.id),
            builder: (artist) => ArtistScreen(artist: artist),
            loader: Loaders.artist,
            onError: () => closeScreen,
          ));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              for (int i = 0; i < artists.length; i++)
                Padding(
                  padding: EdgeInsets.only(left: i * 16),
                  child: LoadingImageCircleAvatar(imageUrl: artists[i].image?.imageUrl, radius: 10),
                ),
            ],
          ),
          const SizedBox(width: 4),
          const Text('Авторы', style: NewTextStyles.bodyRegular),
          const Icon(Icons.chevron_right, size: 20),
        ],
      ),
    );
  }
}
