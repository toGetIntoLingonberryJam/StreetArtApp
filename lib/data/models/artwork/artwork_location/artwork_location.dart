import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'artwork_location.freezed.dart';
part 'artwork_location.g.dart';

@freezed
class ArtworkLocation with _$ArtworkLocation {
  const factory ArtworkLocation({
    required int artworkId,
    required double latitude,
    required double longitude,
    required String address,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'thumbnail_image') required String? previewUrl,
  }) = _ArtworkLocation;

  const ArtworkLocation._();

  factory ArtworkLocation.fromJson(Map<String, dynamic> json) => _$ArtworkLocationFromJson(json);

  LatLng get latlng => LatLng(latitude, longitude);
}
