import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/artwork/artwork_page.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/providers/settings_provider.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/src/services/images_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';

class LocationMarker extends StatelessWidget {
  const LocationMarker({super.key, required this.location});

  final ArtworkLocation location;

  void _openArtwork(BuildContext context) async {
    final future = ArtworkService.getArtworkById(location.artworkId);
    final artwork = await Utils.of(context).showLoading(future);

    if (artwork == null) {
      Utils.showDebugMessage('Не удалось получить данные о работе');
    } else if (context.mounted) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ArtworkPage(artwork: artwork),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openArtwork(context),
      child: location.previewUrl == null
          ? const AppMarkerAvatar(child: Icon(Icons.color_lens_outlined))
          : FutureBuilder(
              future: ImagesService.loadFromDisk(
                location.previewUrl,
                quality: ImageQuality.preview,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AppMarkerAvatar(image: snapshot.data);
                }

                if (snapshot.hasError) {
                  return AppMarkerAvatar(
                    bgColor: Theme.of(context).colorScheme.error,
                  );
                }

                return AppMarkerAvatar(
                  bgColor: Theme.of(context).colorScheme.surface,
                  child: const AppLoadingIndicator(),
                );
              },
            ),
    );
  }
}
