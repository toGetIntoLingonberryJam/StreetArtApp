import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';

class LocationMarker extends StatefulWidget {
  const LocationMarker({super.key, required this.location});

  final ArtworkLocation location;

  @override
  State<LocationMarker> createState() => _LocationMarkerState();
}

class _LocationMarkerState extends State<LocationMarker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.find<GetMapController>().openArtwork(widget.location.artworkId),
      child: widget.location.previewUrl == null
          ? const AppMarkerAvatar(child: Icon(Icons.color_lens_outlined))
          : FutureBuilder(
              future: ImagesService.loadFromDisk(
                widget.location.previewUrl!,
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
