// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageModelImpl _$$ImageModelImplFromJson(Map<String, dynamic> json) =>
    _$ImageModelImpl(
      imageUrl: json['image_url'] as String,
      id: json['id'] as int,
      blurhash: json['blurhash'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ImageModelImplToJson(_$ImageModelImpl instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'id': instance.id,
      'blurhash': instance.blurhash,
      'description': instance.description,
    };
