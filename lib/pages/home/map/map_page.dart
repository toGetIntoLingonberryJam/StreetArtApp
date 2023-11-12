import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/pages/home/map/location_marker.dart';
import 'package:street_art_witnesses/pages/home/map/map_view.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/services/api_service.dart';
import 'package:street_art_witnesses/src/widgets/app_error_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
  final mapController = MapController();
  final artworksFuture = ApiService.getArtworkLocations();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  List<Marker> getMarkers(List<ArtworkLocation> artworks) {
    return artworks
        .map((artwork) => Marker(
            point: LatLng(artwork.latitude, artwork.longitude),
            child: LocationMarker(artwork: artwork)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: artworksFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final markers = getMarkers(snapshot.data!);

                return MapView(mapController: mapController, markers: markers);
              }

              if (snapshot.hasError) {
                return const AppErrorWidget();
              }

              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
