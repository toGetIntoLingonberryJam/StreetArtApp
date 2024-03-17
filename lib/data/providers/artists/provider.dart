import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';

abstract class ArtistsProvider {
  Future<List<ArtistPreview>?> getArtists();
  Future<ArtistPreview?> getArtistById(int artistId);
}
