import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';

part 'festival_preview.freezed.dart';
part 'festival_preview.g.dart';

@freezed
class FestivalPreview with _$FestivalPreview {
  const factory FestivalPreview({
    required int id,
    required String name,
    ImageModel? image,
  }) = _FestivalPreview;

  factory FestivalPreview.fromJson(Map<String, dynamic> json) => _$FestivalPreviewFromJson(json);
}
