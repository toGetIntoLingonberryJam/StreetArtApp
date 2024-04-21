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
      statusCode: json['status'] as String,
      artistPreview: json['artist'] == null
          ? null
          : ArtistPreview.fromJson(json['artist'] as Map<String, dynamic>),
      festivalPreview: json['festival'] == null
          ? null
          : FestivalPreview.fromJson(json['festival'] as Map<String, dynamic>),
      previewUrl: json['preview_image'] as String?,
    );

Map<String, dynamic> _$$ArtworkPreviewImplToJson(
        _$ArtworkPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'status': instance.statusCode,
      'artist': instance.artistPreview,
      'festival': instance.festivalPreview,
      'preview_image': instance.previewUrl,
    };
