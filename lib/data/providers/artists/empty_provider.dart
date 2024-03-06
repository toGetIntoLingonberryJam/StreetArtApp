import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/data/providers/artists/provider.dart';

class EmptyArtistsProvider extends ArtistsProvider {
  @override
  Future<ArtistCardModel?> getArtistById(int artistId) => Future.value(null);

  @override
  Future<List<ArtistCardModel>?> getArtists() => Future.value(null);
}
