import 'package:street_art_witnesses/data/models/artist/artist.dart';

abstract class ArtistsProvider {
  Future<List<ArtistCardModel>?> getArtists();
  Future<ArtistCardModel?> getArtistById(int artistId);
}
