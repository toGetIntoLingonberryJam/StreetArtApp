import 'package:flutter/material.dart';
import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/providers/artists_provider.dart';
import 'package:street_art_witnesses/modules/art/artist/screen.dart';
import 'package:street_art_witnesses/widgets/loaders/loader.dart';

class ArtworkInfo extends StatelessWidget {
  const ArtworkInfo({super.key, required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return SAContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ArtistInfo(artwork.artistPreview),
          const SizedBox(height: 4),
          Text(artwork.title, style: SATextStyles.headline1),
          const SizedBox(height: 8),
          Text('${artwork.yearCreated ?? 'Год неизвестен'}', style: SATextStyles.caption),
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
        style: SATextStyles.headline2,
      );
    }

    return GestureDetector(
      onTap: () => Get.to(() => Loader(
            future: ArtistsProvider.getArtistById(artist!.id),
            builder: (data) => ArtistScreen(artist: data),
            loader: Loaders.artist,
            onError: () => Get.back(),
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          artist!.image == null
              ? SACircleAvatar(image: SAPlaceholder.assetImage())
              : SACircleAvatar(image: NetworkImage(artist!.image!.imageUrl)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(artist!.name, style: SATextStyles.headline2),
          ),
        ],
      ),
    );
  }
}
