// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkImpl _$$ArtworkImplFromJson(Map<String, dynamic> json) =>
    _$ArtworkImpl(
      id: json['id'] as int,
      addedByUserId: json['added_by_user_id'] as int,
      title: json['title'] as String,
      updatedAt: json['updated_at'] as String,
      statusCode: json['status'] as String,
      location:
          ArtworkLocation.fromJson(json['location'] as Map<String, dynamic>),
      yearCreated: json['year_created'] as int?,
      artistId: json['artist_id'] as int?,
      festivalId: json['festival_id'] as int?,
      description: json['description'] as String?,
      sourceDescription: json['source_description'] as String?,
      artistPreviews: (json['artist'] as List<dynamic>?)
          ?.map((e) => ArtistPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
      festivalPreview: json['festival'] == null
          ? null
          : FestivalPreview.fromJson(json['festival'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ArtworkImplToJson(_$ArtworkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'added_by_user_id': instance.addedByUserId,
      'title': instance.title,
      'updated_at': instance.updatedAt,
      'status': instance.statusCode,
      'location': instance.location,
      'year_created': instance.yearCreated,
      'artist_id': instance.artistId,
      'festival_id': instance.festivalId,
      'description': instance.description,
      'source_description': instance.sourceDescription,
      'artist': instance.artistPreviews,
      'festival': instance.festivalPreview,
      'images': instance.images,
      'links': instance.links,
    };
