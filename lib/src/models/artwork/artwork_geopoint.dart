import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class ArtworkGeopoint {
  const ArtworkGeopoint({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.previewUrl,
  });

  final double latitude;
  final double longitude;
  final String address;
  final String? previewUrl;

  GeoPoint asGeoPoint() => GeoPoint(latitude: latitude, longitude: longitude);
}
