import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/providers/artists_provider.dart';
import 'package:street_art_witnesses/data/providers/collection_provider.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/art/artist/screen.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/like_button.dart';
import 'package:street_art_witnesses/widgets/loaders.dart';

class ArtistPreviewWidget extends StatelessWidget {
  const ArtistPreviewWidget(this.preview, {super.key, this.showLike = false});

  final ArtistPreview preview;
  final bool showLike;

  @override
  Widget build(BuildContext context) {
    if (preview.image == null) {
      return _ArtistCard(AppPlaceholder.assetImage(), preview, showLike);
    }

    return FutureBuilder(
      future: ImagesService.loadFromDisk(preview.image!.imageUrl, quality: ImageQuality.good),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _ArtistCard(snapshot.data!, preview, showLike);
        }
        return const Skeleton();
      },
    );
  }
}

class _ArtistCard extends StatelessWidget {
  const _ArtistCard(this.image, this.preview, this.showLike);

  final ImageProvider<Object> image;
  final ArtistPreview preview;
  final bool showLike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => Loader(
            future: ArtistsProvider.getArtistById(preview.id),
            builder: (artist) => ArtistScreen(artist: artist),
            loader: Loaders.artist,
            onError: () => Get.back(),
          )),
      child: Container(
        padding: const EdgeInsets.all(Paddings.normal),
        decoration: BoxDecoration(
          image: DecorationImage(image: image, opacity: 0.5, fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showLike) LikeButton(collType: CollectionType.artists, id: preview.id),
              ],
            ),
            const Spacer(),
            Text(preview.name, style: NewTextStyles.headlineBold, textAlign: TextAlign.start, overflow: TextOverflow.ellipsis, maxLines: 2),
          ],
        ),
      ),
    );
  }
}
