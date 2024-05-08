import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';
import 'package:street_art_witnesses/data/providers/artworks_provider.dart';
import 'package:street_art_witnesses/data/providers/collection_provider.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/author_header.dart';
import 'package:street_art_witnesses/widgets/art/like_button.dart';
import 'package:street_art_witnesses/widgets/loaders.dart';

class ArtworkPreviewWidget extends StatelessWidget {
  const ArtworkPreviewWidget(this.preview, {super.key, this.showAuthor = true, this.showLike = false});

  final ArtworkPreview preview;
  final bool showAuthor;
  final bool showLike;

  @override
  Widget build(BuildContext context) {
    if (preview.previewUrl == null) {
      return _ArtworkCard(AppPlaceholder.assetImage(), preview, showAuthor, showLike);
    }

    return FutureBuilder(
      future: ImagesService.loadFromDisk(preview.previewUrl!, quality: ImageQuality.good),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _ArtworkCard(snapshot.data!, preview, showAuthor, showLike);
        }
        return const Skeleton();
      },
    );
  }
}

class _ArtworkCard extends StatelessWidget {
  const _ArtworkCard(this.image, this.preview, this.showAuthor, this.showLike);

  final ImageProvider<Object> image;
  final ArtworkPreview preview;
  final bool showAuthor;
  final bool showLike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => Loader(
            future: ArtworksProvider.getArtworkById(preview.id),
            builder: (artwork) => ArtworkScreen(artwork: artwork),
            loader: Loaders.artwork,
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
                if (showAuthor && preview.artistPreview != null) Expanded(child: ArtistHeaderWidget.fromArtistPreview(preview.artistPreview!)),
                if (showLike) LikeButton(collType: CollectionType.artworks, id: preview.id),
              ],
            ),
            const Spacer(),
            Text(
              preview.title,
              style: NewTextStyles.bodyRegular,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: Paddings.small),
            Row(
              children: [
                const Icon(Icons.near_me_rounded, size: 12, color: UIColors.greyButtonLight),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    preview.address,
                    style: NewTextStyles.caption1Semibold.copyWith(color: UIColors.greyButtonLight),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
