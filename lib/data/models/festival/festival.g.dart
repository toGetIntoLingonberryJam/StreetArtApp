// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FestivalImpl _$$FestivalImplFromJson(Map<String, dynamic> json) =>
    _$FestivalImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      description: json['description'] as String?,
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$FestivalImplToJson(_$FestivalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'links': instance.links,
    };
