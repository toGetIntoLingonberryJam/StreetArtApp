import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';

abstract class ArtistsProvider {
  Future<List<ArtistPreview>?> getArtists();
  Future<Artist?> getArtistById(int artistId);
}
