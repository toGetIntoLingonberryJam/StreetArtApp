import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';

part 'artwork_ticket.freezed.dart';

@freezed
class ArtworkTicket with _$ArtworkTicket {
  factory ArtworkTicket._({required int id, required Artwork artwork}) = _ArtworkTicket;

  factory ArtworkTicket.fromJson(Map<String, dynamic> json) {
    return ArtworkTicket._(id: json['id'], artwork: Artwork.fromTicket(json));
  }
}
