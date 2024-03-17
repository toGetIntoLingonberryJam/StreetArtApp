// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FestivalPreviewImpl _$$FestivalPreviewImplFromJson(
        Map<String, dynamic> json) =>
    _$FestivalPreviewImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FestivalPreviewImplToJson(
        _$FestivalPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
