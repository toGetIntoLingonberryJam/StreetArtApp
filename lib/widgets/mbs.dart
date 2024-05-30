import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';

abstract class ArtMbs {
  static Future<ArtistPreview?> showArtistsPicker(BuildContext context, List<ArtistPreview> artists) async {
    return await showModalBottomSheet(
      context: context,
      builder: (context) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            color: UIColors.backgroundCard,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              for (final artist in artists)
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(artist),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                    child: Row(
                      children: [
                        LoadingImageCircleAvatar(imageUrl: artist.image?.imageUrl, radius: 20),
                        const SizedBox(width: 12),
                        Expanded(child: Text(artist.name, style: NewTextStyles.bodyBold)),
                        const SizedBox(width: 12),
                        const Icon(Icons.chevron_right, size: 20, color: UIColors.textSecondary),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }
}
