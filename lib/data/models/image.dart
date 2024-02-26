class ImageSchema {
  const ImageSchema({required this.imageUrl, required this.createdAt, this.description});

  ImageSchema.fromJson(Map<String, dynamic> json)
      : imageUrl = json['image_url'],
        createdAt = json['created_at'],
        description = json['description'];

  final String imageUrl;
  final String createdAt;
  final String? description;
}
