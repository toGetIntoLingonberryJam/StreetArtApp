import 'package:flutter/material.dart';
import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';

class FestivalInfoWidget extends StatelessWidget {
  const FestivalInfoWidget(this.festival, {super.key, this.includeBottomPadding = true});

  final FestivalPreview? festival;
  final bool includeBottomPadding;

  @override
  Widget build(BuildContext context) {
    if (festival == null) return const SizedBox();

    return SAContainer.small(
      child: Row(
        children: [
          festival!.image == null
              ? SACircleAvatar(image: SAPlaceholder.assetImage())
              : SACircleAvatar(image: NetworkImage(festival!.image!.imageUrl)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(festival!.name, style: SATextStyles.headline1),
          ),
        ],
      ),
    );
  }
}
