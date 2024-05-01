// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_preview.freezed.dart';
part 'artist_preview.g.dart';

@freezed
class ArtistPreview with _$ArtistPreview {
  const factory ArtistPreview({
    required int id,
    required String name,
    @JsonKey(name: 'preview_image') required String? previewUrl,
    // ImageModel? image,
  }) = _ArtistPreview;

  factory ArtistPreview.fromJson(Map<String, dynamic> json) => _$ArtistPreviewFromJson(json);
}
