// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkPreviewImpl _$$ArtworkPreviewImplFromJson(Map<String, dynamic> json) =>
    _$ArtworkPreviewImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      address: json['address'] as String,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      statusCode: json['status'] as String,
      artistsPreview: (json['artist'] as List<dynamic>?)
          ?.map((e) => ArtistPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
      festivalPreview: json['festival'] == null
          ? null
          : FestivalPreview.fromJson(json['festival'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtworkPreviewImplToJson(
        _$ArtworkPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'image': instance.image,
      'status': instance.statusCode,
      'artist': instance.artistsPreview,
      'festival': instance.festivalPreview,
    };
