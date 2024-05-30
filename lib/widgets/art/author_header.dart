import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/image_slider_base.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class ArtistHeaderWidget extends StatelessWidget {
  const ArtistHeaderWidget(this.preview, {super.key});

  final ArtistPreview preview;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: preview.image == null ? const AppPlaceholder() : LoadingImage(preview.image!),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(preview.name, style: NewTextStyles.footnoteRegular, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
