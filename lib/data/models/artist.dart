import 'package:street_art_witnesses/data/models/image.dart';

class Artist {
  const Artist({required this.id, required this.name, this.image});

  Artist.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'] == null ? null : ImageSchema.fromJson(json['image']);

  final int id;
  final String name;
  final ImageSchema? image;
}
