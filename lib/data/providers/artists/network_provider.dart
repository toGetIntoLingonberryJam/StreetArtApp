import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artist.dart';
import 'package:street_art_witnesses/data/providers/artists/provider.dart';

class NetworkArtistsProvider implements ArtistsProvider {
  @override
  Future<Artist?> getArtistById(int artistId) async {
    final response = await BackendApi.get('v1/artists/$artistId');
    if (response == null) return null;

    return Artist.fromJson(response.data);
  }

  @override
  Future<List<Artist>?> getArtists({
    int page = 1,
    int size = 20,
    String? search,
    String? orderBy,
  }) async {
    final response = await BackendApi.get('v1/artists');
    if (response == null) return null;

    final List<Artist> artists = [];
    for (var artistData in response.data) {
      artists.add(Artist.fromJson(artistData));
    }
    return artists;
  }
}
