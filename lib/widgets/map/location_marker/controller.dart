import 'package:get/get.dart';
import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location/artwork_location.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';

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
            ? const SAMarkerAvatar(child: Icon(Icons.color_lens_outlined))
            : image == null
                ? SAMarkerAvatar(bgColor: Get.theme.colorScheme.secondary)
                : SAMarkerAvatar(image: image),
      );
}
