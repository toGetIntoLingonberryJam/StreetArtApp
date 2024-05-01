// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistPreviewImpl _$$ArtistPreviewImplFromJson(Map<String, dynamic> json) =>
    _$ArtistPreviewImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      previewUrl: json['preview_image'] as String?,
    );

Map<String, dynamic> _$$ArtistPreviewImplToJson(_$ArtistPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'preview_image': instance.previewUrl,
    };
