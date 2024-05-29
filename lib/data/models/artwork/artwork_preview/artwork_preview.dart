// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';

part 'artwork_preview.freezed.dart';
part 'artwork_preview.g.dart';

@freezed
class ArtworkPreview with _$ArtworkPreview {
  const factory ArtworkPreview({
    required int id,
    required String title,
    required String address,
    ImageModel? image,
    @JsonKey(name: 'status') required String statusCode,
    @JsonKey(name: 'artist') List<ArtistPreview>? artistsPreview,
    @JsonKey(name: 'festival') FestivalPreview? festivalPreview,
  }) = _ArtworkPreview;

  factory ArtworkPreview.fromJson(Map<String, dynamic> json) => _$ArtworkPreviewFromJson(json);
  const ArtworkPreview._();

  ArtworkStatus get status {
    for (final status in ArtworkStatus.values) {
      if (statusCode == status.name) return status;
    }
    return ArtworkStatus.unknown;
  }
}
