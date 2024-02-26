import 'package:street_art_witnesses/data/models/artist.dart';

abstract class ArtistsProvider {
  Future<List<Artist>?> getArtists();
  Future<Artist?> getArtistById(int artistId);
}
