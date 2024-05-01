import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/data/providers/collection_provider.dart';
import 'package:street_art_witnesses/data/providers/festivals_provider.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/art/festival/screen.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/like_button.dart';
import 'package:street_art_witnesses/widgets/loaders.dart';

class FestivalPreviewWidget extends StatelessWidget {
  const FestivalPreviewWidget(this.preview, {super.key, this.showLike = false});

  final FestivalPreview preview;
  final bool showLike;

  @override
  Widget build(BuildContext context) {
    if (preview.image?.imageUrl == null) {
      return _FestivalCard(AppPlaceholder.assetImage(), preview, showLike);
    }

    return FutureBuilder(
      future: ImagesService.loadFromDisk(preview.image!.imageUrl, quality: ImageQuality.good),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _FestivalCard(snapshot.data!, preview, showLike);
        }
        return const Skeleton();
      },
    );
  }
}

class _FestivalCard extends StatelessWidget {
  const _FestivalCard(this.image, this.preview, this.showLike);

  final ImageProvider<Object> image;
  final FestivalPreview preview;
  final bool showLike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => Loader(
            future: FestivalsProvider.getFestivalById(preview.id),
            builder: (festival) => FestivalScreen(festival: festival),
            loader: Loaders.festival,
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
                if (showLike) LikeButton(collType: CollectionType.festivals, id: preview.id),
              ],
            ),
            const Spacer(),
            Text(
              preview.name,
              style: TextStyles.headline2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
