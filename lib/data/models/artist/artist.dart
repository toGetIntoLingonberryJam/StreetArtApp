import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';

part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
class Artist with _$Artist {
  const factory Artist({
    required int id,
    required String name,
    required ImageModel image,
    String? description,
    List<String>? links,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}
