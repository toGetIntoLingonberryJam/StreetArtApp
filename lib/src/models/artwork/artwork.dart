import 'package:street_art_witnesses/src/models/artwork/artwork_image.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';

class Artwork {
  const Artwork({
    required this.title,
    required this.yearCreated,
    required this.description,
    required this.sourceDescription,
    required this.artistId,
    required this.festivalId,
    required this.status,
    required this.id,
    required this.addedByUserId,
    required this.updatedAt,
    required this.location,
    required this.images,
  });

  Artwork.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        yearCreated = json['year_created'],
        description = json['description'],
        sourceDescription = json['source_description'],
        artistId = json['artist_id'],
        festivalId = json['festival_id'],
        status = json['status'],
        id = json['id'],
        addedByUserId = json['added_by_user_id'],
        updatedAt = json['updated_at'],
        location = ArtworkLocation.fromJson(json['location']),
        images = json['images'] == null
            ? null
            : (json['images'] as List).map((json) => ArtworkImage.fromJson(json)).toList();

  final String title;
  final int yearCreated;
  final String description;
  final String sourceDescription;

  final int? artistId;
  final int? festivalId;

  final String status;
  final int id;
  final int addedByUserId;
  final String updatedAt;

  final ArtworkLocation location;
  final List<ArtworkImage>? images;
}
