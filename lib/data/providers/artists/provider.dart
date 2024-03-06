import 'package:street_art_witnesses/data/models/artist/artist_card.dart';

abstract class ArtistsProvider {
  Future<List<ArtistCardModel>?> getArtists();
  Future<ArtistCardModel?> getArtistById(int artistId);
}
