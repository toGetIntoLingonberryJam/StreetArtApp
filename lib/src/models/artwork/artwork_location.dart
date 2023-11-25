class ArtworkLocation {
  ArtworkLocation({
    required this.artworkId,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.previewUrl,
  });

  ArtworkLocation.fromJson(Map<String, dynamic> json)
      : artworkId = json['artwork_id'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        address = json['address'],
        previewUrl = json['thumbnail_image'];

  final int artworkId;
  final double latitude;
  final double longitude;
  final String address;
  final String? previewUrl;
}
