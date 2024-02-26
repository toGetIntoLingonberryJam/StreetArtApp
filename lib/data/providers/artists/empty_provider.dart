import 'package:street_art_witnesses/data/models/artist.dart';
import 'package:street_art_witnesses/data/providers/artists/provider.dart';

class EmptyArtistsProvider extends ArtistsProvider {
  @override
  Future<Artist?> getArtistById(int artistId) => Future.value(null);

  @override
  Future<List<Artist>?> getArtists() => Future.value(null);
}
