import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/pages/home/map/location_marker.dart';
import 'package:street_art_witnesses/pages/home/map/map_view.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/widgets/app_error_widget.dart';
import 'package:street_art_witnesses/widgets/app_loading_indicator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapController = MapController();
  final locationsFuture = ArtworkService.getLocations();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  List<Marker> getMarkers(List<ArtworkLocation> locations) {
    return locations
        .where((element) => element.latitude >= -90 && element.latitude <= 90)
        .map((location) => Marker(
            point: LatLng(location.latitude, location.longitude),
            child: LocationMarker(location: location)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: locationsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final markers = getMarkers(snapshot.data!);

                return MapView(mapController: mapController, markers: markers);
              }

              if (snapshot.hasError) {
                return const AppErrorWidget();
              }

              return const AppLoadingIndicator();
            }),
      ),
    );
  }
}
