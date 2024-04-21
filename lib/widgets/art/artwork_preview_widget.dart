import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';
import 'package:street_art_witnesses/data/providers/artworks_provider.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/author_header.dart';
import 'package:street_art_witnesses/widgets/loaders/loader.dart';

class ArtworkPreviewWidget extends StatelessWidget {
  const ArtworkPreviewWidget(this.preview, {super.key, this.showAuthor = true});

  final ArtworkPreview preview;
  final bool showAuthor;

  @override
  Widget build(BuildContext context) {
    if (preview.previewUrl == null) {
      return _Card(image: AppPlaceholder.assetImage(), preview: preview, showAuthor: showAuthor);
    }

    return FutureBuilder(
      future: ImagesService.loadFromDisk(preview.previewUrl!, quality: ImageQuality.good),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _Card(preview: preview, image: snapshot.data!, showAuthor: showAuthor);
        }
        return const Skeleton();
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.image, required this.preview, required this.showAuthor});

  final ImageProvider<Object> image;
  final ArtworkPreview preview;
  final bool showAuthor;

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
            if (showAuthor && preview.artistPreview != null) ArtistHeaderWidget.fromArtistPreview(preview.artistPreview!),
            const Spacer(),
            Text(
              preview.title,
              style: TextStyles.headline2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: Paddings.small),
            Row(
              children: [
                const Icon(Icons.near_me_rounded, size: 12),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    preview.address,
                    style: TextStyles.caption.copyWith(fontWeight: FontWeight.w500, color: UIColors.textPrimary),
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
