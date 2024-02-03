class ArtworkImage {
  const ArtworkImage({required this.imageUrl});

  ArtworkImage.fromJson(Map<String, dynamic> json) : imageUrl = json['image_url'];

  final String imageUrl;
}
