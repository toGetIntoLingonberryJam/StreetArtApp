import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/providers/artists/provider.dart';

class EmptyArtistsProvider extends ArtistsProvider {
  @override
  Future<Artist?> getArtistById(int artistId) => Future.value(null);

  @override
  Future<List<ArtistPreview>?> getArtists() => Future.value(null);
}
