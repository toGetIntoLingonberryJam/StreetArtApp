import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class FestivalsView extends StatelessWidget {
  const FestivalsView({super.key, required this.festsPrevs});

  final List<FestivalPreview>? festsPrevs;

  @override
  Widget build(BuildContext context) {
    if (festsPrevs == null) {
      return const Center(child: AppLoadingIndicator());
    }
    if (festsPrevs!.isEmpty) {
      return const Center(
          child: Text(
        'У вас нет сохраненных фестивалей',
        style: TextStyles.headline2,
      ));
    }

    return ListView.separated(
      itemCount: festsPrevs!.length,
      itemBuilder: (_, index) => FestCard(festsPrevs![index]),
      separatorBuilder: (_, __) => const SizedBox(height: Paddings.small),
    );
  }
}

class FestCard extends StatelessWidget {
  const FestCard(this.preview, {super.key});

  final FestivalPreview preview;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingImageCircleAvatar(imageUrl: preview.image?.imageUrl, radius: 50),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.centerLeft,
              child: Text(preview.name, style: TextStyles.headline1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
