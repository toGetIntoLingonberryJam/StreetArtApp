import 'package:street_art_witnesses/data/models/artwork/artwork.dart';

class ArtworkTicket {
  ArtworkTicket._(this.id, this.artwork);

  final int id;
  final Artwork artwork;

  factory ArtworkTicket.fromJson(Map<String, dynamic> json) =>
      ArtworkTicket._(json['id'], Artwork.fromTicket(json));
}
