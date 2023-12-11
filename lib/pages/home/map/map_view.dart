import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/pages/home/map/controllers_layer.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class MapView extends StatefulWidget {
  const MapView({
    super.key,
    required this.markers,
  });

  final List<Marker> markers;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with TickerProviderStateMixin {
  late final animatedController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
    curve: Curves.easeInOut,
  );

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: animatedController.mapController,
      options: MapOptions(
        initialZoom: 12,
        // keepAlive: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        initialCenter: const LatLng(56.8519, 60.6122),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerLayer(markers: widget.markers),
        RichAttributionWidget(
          alignment: AttributionAlignment.bottomLeft,
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => Utils.tryLaunchUrl(
                context,
                Uri.parse('https://openstreetmap.org/copyright'),
              ),
            ),
          ],
        ),
        ControllersLayer(controller: animatedController),
      ],
    );
  }
}
