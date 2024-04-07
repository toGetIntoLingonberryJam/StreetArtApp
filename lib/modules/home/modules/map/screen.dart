import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/modules/home/modules/map/layers/controllers/layer.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetMapController>(builder: (c) {
      return Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: c.mapController.mapController,
              options: MapOptions(
                keepAlive: true,
                initialZoom: 12,
                backgroundColor: Theme.of(context).colorScheme.background,
                initialCenter: const LatLng(56.8519, 60.6122),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  tileProvider: CancellableNetworkTileProvider(),
                ),
                if (c.navigator.show)
                  PolylineLayer(
                    polylines: [
                      Polyline(strokeWidth: 5, color: Colors.red, points: c.navigator.points),
                    ],
                  ),
                MarkerLayer(markers: c.markers),
                RichAttributionWidget(
                  alignment: AttributionAlignment.bottomLeft,
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => Utils.tryLaunchUrl(
                        Uri.parse('https://openstreetmap.org/copyright'),
                      ),
                    ),
                  ],
                ),
                const MapControllersLayer(),
              ],
            ),
          ),
          if (c.navigator.show)
            SAPrimaryButton(
              onTap: () => c.navigator.cancel(),
              label: 'Отменить следование',
            ),
        ],
      );
    });
  }
}
