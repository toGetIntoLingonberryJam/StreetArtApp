import 'package:street_art_witnesses/core/utils/error_handler.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artist.dart';
import 'package:street_art_witnesses/data/providers/artists/provider.dart';

class NetworkArtistsProvider with ErrorHandler implements ArtistsProvider {
  @override
  Future<Artist?> getArtistById(int artistId) async => handleApiRequest(
        BackendApi.get('/v1/artists/$artistId'),
        onResult: (r) => Artist.fromJson(r.data),
      );

  @override
  Future<List<Artist>?> getArtists({
    int page = 1,
    int size = 20,
    String? search,
    String? orderBy,
  }) async =>
      handleApiRequest(BackendApi.get('/v1/artists'), onResult: (r) {
        final artists = <Artist>[];
        for (var json in r.data['items']) {
          artists.add(Artist.fromJson(json));
        }
        return artists;
      });
}
