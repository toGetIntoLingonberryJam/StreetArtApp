import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';

class LocationMarkerController extends GetxController {
  LocationMarkerController(this.location);

  final ArtworkLocation location;
  ImageProvider? image;

  @override
  void onInit() {
    super.onInit();
    loadImage();
  }

  void loadImage() async {
    if (location.previewUrl == null) return;
    image = await ImagesService.loadFromDisk(location.previewUrl!, quality: ImageQuality.preview);
    update();
  }

  Widget get widget => GestureDetector(
        onTap: () => Get.find<GetMapController>().openArtwork(location.artworkId),
        child: location.previewUrl == null
            ? const AppMarkerAvatar(child: Icon(Icons.color_lens_outlined))
            : image == null
                ? AppMarkerAvatar(
                    bgColor: Get.theme.colorScheme.surface,
                    child: const AppLoadingIndicator(),
                  )
                : AppMarkerAvatar(image: image),
      );
}
