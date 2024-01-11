import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/pages/home/map/location_marker.dart';
import 'package:street_art_witnesses/pages/home/map/map_view.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/widgets/other/app_error_widget.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

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
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: ArtworkService.getLocations(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final markers = parseMarkers(snapshot.data!);
                return MapView(markers: markers);
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
