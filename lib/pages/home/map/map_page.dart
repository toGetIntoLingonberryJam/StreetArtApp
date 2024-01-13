import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/pages/home/map/controllers_layer.dart';
import 'package:street_art_witnesses/pages/home/map/location_marker.dart';
import 'package:street_art_witnesses/src/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  late final controller = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    super.initState();
    ArtworkService.getLocations(context).then((locations) {
      context.read<MapCubit>().setMarkers(parseMarkers(locations));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Marker> parseMarkers(List<ArtworkLocation> locations) {
    return locations
        .where((element) => element.latitude >= -90 && element.latitude <= 90)
        .map((location) => Marker(
            point: LatLng(location.latitude, location.longitude),
            child: LocationMarker(location: location)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {
        if (state is MapTaskState) state.task.complete(context);
      },
      builder: (context, state) {
        final cubit = context.read<MapCubit>();
        if (state is MapNavigator) {
          return _MapView(controller, markers: cubit.markers, route: state.route);
        }
        return _MapView(controller, markers: cubit.markers);
      },
    );
  }
}

class _MapView extends StatelessWidget {
  const _MapView(this.controller, {this.markers, this.route});

  final AnimatedMapController controller;
  final List<Marker>? markers;
  final List<LatLng>? route;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller.mapController,
      options: MapOptions(
        initialZoom: 12,
        backgroundColor: Theme.of(context).colorScheme.background,
        initialCenter: const LatLng(56.8519, 60.6122),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        if (route != null)
          PolylineLayer(
            polylines: [
              Polyline(
                strokeWidth: 5,
                color: Colors.red,
                points: route!,
              ),
            ],
          ),
        if (markers != null) MarkerLayer(markers: markers!),
        RichAttributionWidget(
          alignment: AttributionAlignment.bottomLeft,
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => Utils.of(context).tryLaunchUrl(
                Uri.parse('https://openstreetmap.org/copyright'),
              ),
            ),
          ],
        ),
        ControllersLayer(controller: controller),
      ],
    );
  }
}
