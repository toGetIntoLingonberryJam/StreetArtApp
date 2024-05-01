import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/data/providers/festivals_provider.dart';
import 'package:street_art_witnesses/modules/art/festival/screen.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/loaders.dart';

class FestivalInfoWidget extends StatelessWidget {
  const FestivalInfoWidget(this.festival, {super.key, this.includeBottomPadding = true});

  final FestivalPreview? festival;
  final bool includeBottomPadding;

  @override
  Widget build(BuildContext context) {
    if (festival == null) return const SizedBox();

    return GestureDetector(
      onTap: () => Get.to(() => Loader(
            future: FestivalsProvider.getFestivalById(festival!.id),
            builder: (fest) => FestivalScreen(festival: fest),
            loader: Loaders.festival,
            onError: () => Get.back(),
          )),
      child: AppContainer(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingImageCircleAvatar(imageUrl: festival?.image?.imageUrl, radius: 10),
            const SizedBox(width: 8),
            Expanded(child: Text(festival!.name, style: TextStyles.headline1)),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
