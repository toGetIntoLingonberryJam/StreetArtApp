import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';

part 'festival.freezed.dart';
part 'festival.g.dart';

@freezed
class Festival with _$Festival {
  const factory Festival({
    required int id,
    required String name,
    required ImageModel? image,
    String? description,
    List<String>? links,
  }) = _Festival;

  factory Festival.fromJson(Map<String, dynamic> json) => _$FestivalFromJson(json);
}
