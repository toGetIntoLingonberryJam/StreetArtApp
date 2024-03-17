// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistPreviewImpl _$$ArtistPreviewImplFromJson(Map<String, dynamic> json) =>
    _$ArtistPreviewImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtistPreviewImplToJson(_$ArtistPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
