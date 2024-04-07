import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/data/providers/artworks_provider.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/widgets/loaders/loader.dart';
import 'package:street_art_witnesses/widgets/map/location_marker/marker.dart';

class GetMapController extends GetxController with GetTickerProviderStateMixin {
  GetMapController({this.showLocations = true});

  final bool showLocations;

  late final mapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
    curve: Curves.easeInOut,
  );
  final searchController = TextEditingController();
  final navigator = Get.put(MapNavigator());
  List<Marker> markers = [];

  LatLng get mapCenter => mapController.mapController.camera.center;

  @override
  void onInit() {
    if (showLocations) fetchLocations();
    super.onInit();
  }

  @override
  void dispose() {
    mapController.dispose();
    searchController.dispose();
    navigator.dispose();
    super.dispose();
  }

  void fetchLocations() async {
    final locations = await ArtworksProvider.getArtworkLocations() ?? [];
    markers = locations
        .where((element) => element.latitude >= -90 && element.latitude <= 90)
        .map((location) => Marker(
              point: LatLng(location.latitude, location.longitude),
              child: LocationMarker(location: location, key: ObjectKey(location)),
            ))
        .toList();
    update();
  }

  void openArtwork(int id) => Get.to(() => Loader(
        future: ArtworksProvider.getArtworkById(id),
        builder: (a) => ArtworkScreen(artwork: a),
        loader: Loaders.artwork,
        onError: () => Get.back(),
      ));
}

class MapNavigator extends GetxController {
  bool get show => false;

  final points = [
    const LatLng(56.8395722, 60.6077429),
    const LatLng(56.8519, 60.6122),
    const LatLng(56.86, 60.616),
    const LatLng(56.8537, 60.6222),
    const LatLng(56.8509, 60.639),
  ];

  void cancel() {
    points.clear();
    update();
  }

  void setRouteToArtwork(int artworkId) {
    // TODO: implement setting route (address_info.dart, map_task.dart)
  }
}
