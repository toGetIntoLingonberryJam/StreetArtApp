import 'package:street_art_witnesses/data/models/festival/festival_card.dart';
import 'package:street_art_witnesses/data/models/image.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/data/models/artist/artist_card.dart';

enum ArtworkStatus { existing, destroyed, overpainted, unknown }

class Artwork {
  final int id;
  final int addedByUserId;
  final int? yearCreated;
  final int? artistId;
  final int? festivalId;
  final String title;
  final String updatedAt;
  final String? description;
  final String? sourceDescription;

  final ArtworkStatus status;
  final ArtworkLocation location;
  final ArtistCardModel? artist;
  final FestivalCardModel? festival;
  final List<ImageSchema>? images;
  final List<String>? links;

  const Artwork({
    required this.title,
    required this.yearCreated,
    required this.description,
    required this.sourceDescription,
    required this.artistId,
    required this.artist,
    required this.festivalId,
    required this.festival,
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
        artist = json['artist'] == null ? null : ArtistCardModel.fromJson(json['artist']),
        festivalId = json['festival_id'],
        festival = json['festival'] == null ? null : FestivalCardModel.fromJson(json['festival']),
        status = _stringToStatus(json['status']),
        id = json['id'] ?? -1,
        addedByUserId = json['added_by_user_id'],
        updatedAt = json['updated_at'],
        location = ArtworkLocation.fromJson(json['location']),
        links =
            json['links'] == null ? null : (json['links'] as List).map((e) => e as String).toList(),
        images = json['images'] == null
            ? null
            : (json['images'] as List).map((imgJson) => ImageSchema.fromJson(imgJson)).toList();
}

ArtworkStatus _stringToStatus(String string) {
  for (final status in ArtworkStatus.values) {
    if (string == status.name) return status;
  }
  return ArtworkStatus.unknown;
}
