import 'package:street_art_witnesses/src/models/artwork/artwork_image.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';

enum ArtworkStatus { existing, destroyed, overpainted, unknown }

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
    required this.links,
  });

  static Artwork fromTicket(Map<String, dynamic> data) {
    final artworkData = data['artwork_data'];
    artworkData['id'] = data['artwork_id'];
    artworkData['added_by_user_id'] = data['user_id'];
    artworkData['updated_at'] = data['updated_at'];
    artworkData['location']['artwork_id'] = data['artwork_id'] ?? -1;
    return Artwork.fromJson(artworkData);
  }

  Artwork.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        yearCreated = json['year_created'],
        description = json['description'],
        sourceDescription = json['source_description'],
        artistId = json['artist_id'],
        festivalId = json['festival_id'],
        status = _stringToStatus(json['status']),
        id = json['id'] ?? -1,
        addedByUserId = json['added_by_user_id'],
        updatedAt = json['updated_at'],
        location = ArtworkLocation.fromJson(json['location']),
        links =
            json['links'] == null ? null : (json['links'] as List).map((e) => e as String).toList(),
        images = json['images'] == null
            ? null
            : (json['images'] as List).map((imgJson) => ArtworkImage.fromJson(imgJson)).toList();

  final String title;
  final int? yearCreated;
  final String? description;
  final String? sourceDescription;

  final int? artistId;
  final int? festivalId;

  final ArtworkStatus status;
  final int id;
  final int addedByUserId;
  final String updatedAt;

  final ArtworkLocation location;
  final List<ArtworkImage>? images;
  final List<String>? links;
}

ArtworkStatus _stringToStatus(String string) {
  for (final status in ArtworkStatus.values) {
    if (string == status.name) return status;
  }
  return ArtworkStatus.unknown;
}
