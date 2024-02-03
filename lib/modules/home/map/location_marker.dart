import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/artwork/artwork_page.dart';
import 'package:street_art_witnesses/src/blocs/settings/settings_cubit.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/src/services/images_service.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';

class LocationMarker extends StatefulWidget {
  const LocationMarker({super.key, required this.location});

  final ArtworkLocation location;

  @override
  State<LocationMarker> createState() => _LocationMarkerState();
}

class _LocationMarkerState extends State<LocationMarker> {
  ImageProvider? imageProvider;

  late final previewFuture = ImagesService.loadFromDisk(
    widget.location.previewUrl,
    quality: ImageQuality.preview,
  );

  void _openArtwork(BuildContext context) async {
    final future = ArtworkService.getArtworkById(widget.location.artworkId);
    final artwork = await Utils.of(context).showLoading(future);
    if (!context.mounted) return;

    if (artwork == null) {
      Utils.of(context).showMessage('Не удалось получить данные о работе');
    } else {
      Get.to(() => ArtworkPage(artwork: artwork));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openArtwork(context),
      child: widget.location.previewUrl == null
          ? const AppMarkerAvatar(child: Icon(Icons.color_lens_outlined))
          : FutureBuilder(
              future: previewFuture,
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
