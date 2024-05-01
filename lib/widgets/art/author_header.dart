import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/image_slider_base.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class ArtistHeaderWidget extends StatelessWidget {
  const ArtistHeaderWidget({super.key, required this.name, required this.previewUrl});

  ArtistHeaderWidget.fromArtistPreview(ArtistPreview preview, {super.key})
      : name = preview.name,
        previewUrl = preview.previewUrl;

  final String? previewUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: previewUrl == null ? const AppPlaceholder() : LoadingImage.fromPreviewUrl(previewUrl!),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(name, style: TextStyles.textAdditional, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
