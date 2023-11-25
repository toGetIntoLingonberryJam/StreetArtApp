class ArtworkImage {
  const ArtworkImage({
    required this.imageUrl,
    required this.id,
  });

  ArtworkImage.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image_url'];

  final String imageUrl;
  final int id;
}
