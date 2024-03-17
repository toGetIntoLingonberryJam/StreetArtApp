import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location/artwork_location.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';

part 'artwork.freezed.dart';
part 'artwork.g.dart';

enum ArtworkStatus { existing, destroyed, overpainted, unknown }

@freezed
class Artwork with _$Artwork {
  const Artwork._();

  const factory Artwork({
    required int id,
    required int addedByUserId,
    required String title,
    required String updatedAt,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'status') required String statusCode,
    required ArtworkLocation location,
    int? yearCreated,
    int? artistId,
    int? festivalId,
    String? description,
    String? sourceDescription,
    ArtistPreview? artistPreview,
    FestivalPreview? festivalPreview,
    List<ImageModel>? images,
    List<String>? links,
  }) = _Artwork;

  ArtworkStatus get status {
    for (final status in ArtworkStatus.values) {
      if (statusCode == status.name) return status;
    }
    return ArtworkStatus.unknown;
  }

  factory Artwork.fromTicket(Map<String, dynamic> data) {
    final artworkData = data['artwork_data'];
    artworkData['id'] = data['artwork_id'] ?? -1;
    artworkData['added_by_user_id'] = data['user_id'];
    artworkData['updated_at'] = data['updated_at'];
    artworkData['location']['artwork_id'] = data['artwork_id'] ?? -1;
    return Artwork.fromJson(artworkData);
  }

  factory Artwork.fromJson(Map<String, dynamic> json) => _$ArtworkFromJson(json);
}
