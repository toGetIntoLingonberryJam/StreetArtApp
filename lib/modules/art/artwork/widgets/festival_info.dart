import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class FestivalInfoWidget extends StatelessWidget {
  const FestivalInfoWidget(this.festival, {super.key, this.includeBottomPadding = true});

  final FestivalPreview? festival;
  final bool includeBottomPadding;

  @override
  Widget build(BuildContext context) {
    if (festival == null) return const SizedBox();

    return AppContainer.small(
      child: Row(
        children: [
          festival!.image == null
              ? AppCircleAvatar(image: AppPlaceholder.assetImage())
              : AppCircleAvatar(image: NetworkImage(festival!.image!.imageUrl)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(festival!.name, style: TextStyles.headline1),
          ),
        ],
      ),
    );
  }
}
