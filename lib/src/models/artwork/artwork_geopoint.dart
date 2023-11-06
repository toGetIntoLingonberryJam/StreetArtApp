class ArtworkGeopoint {
  const ArtworkGeopoint({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.previewUrl,
  });

  final double latitude;
  final double longitude;
  final String address;
  final String? previewUrl;
  final int id;
}
