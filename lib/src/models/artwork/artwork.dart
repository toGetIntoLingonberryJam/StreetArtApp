import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';

class Artwork {
  const Artwork({
    required this.id,
    required this.title,
    required this.yearCreated,
    required this.festival,
    required this.description,
    required this.sourceDescription,
    required this.artistId,
    required this.status,
    required this.addedByUserId,
    required this.location,
    required this.images,
    required this.updatedAt,
  });

  Artwork.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        yearCreated = json['year_created'],
        festival = json['festival'],
        description = json['description'],
        sourceDescription = json['source_description'],
        artistId = json['artist_id'],
        status = json['status'],
        addedByUserId = json['added_by_user_id'],
        location = ArtworkLocation.fromJson(json['location']),
        images = json['images'] == null
            ? null
            : (json['images'] as List)
                .map((json) => ArtworkImage.fromJson(json))
                .toList(),
        updatedAt = json['updated_at'];

  final int id;
  final int artistId;
  final int addedByUserId;

  final String title;
  final String description;
  final String? festival;
  final String sourceDescription;
  final String status;
  final String updatedAt;
  final int yearCreated;

  final ArtworkLocation location;
  final List<ArtworkImage>? images;
}

class ArtworkImage {
  const ArtworkImage({
    required this.imageUrl,
    required this.id,
  });

  ArtworkImage.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image_url'];

  final String imageUrl;
  final int id;
}
