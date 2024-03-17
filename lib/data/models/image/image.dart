import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String imageUrl,
    required String createdAt,
    String? description,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}
