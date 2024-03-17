// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkLocationImpl _$$ArtworkLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkLocationImpl(
      artworkId: json['artwork_id'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
      previewUrl: json['thumbnail_image'] as String?,
    );

Map<String, dynamic> _$$ArtworkLocationImplToJson(
        _$ArtworkLocationImpl instance) =>
    <String, dynamic>{
      'artwork_id': instance.artworkId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'thumbnail_image': instance.previewUrl,
    };
