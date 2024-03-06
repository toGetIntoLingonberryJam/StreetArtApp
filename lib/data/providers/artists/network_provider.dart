import 'package:street_art_witnesses/core/utils/error_handler.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/data/providers/artists/provider.dart';

class NetworkArtistsProvider with ErrorHandler implements ArtistsProvider {
  @override
  Future<ArtistCardModel?> getArtistById(int artistId) async => handleApiRequest(
        BackendApi.get('/v1/artists/$artistId'),
        onResult: (r) => ArtistCardModel.fromJson(r.data),
      );

  @override
  Future<List<ArtistCardModel>?> getArtists({
    int page = 1,
    int size = 20,
    String? search,
    String? orderBy,
  }) async =>
      handleApiRequest(BackendApi.get('/v1/artists'), onResult: (r) {
        final artists = <ArtistCardModel>[];
        for (var json in r.data['items']) {
          artists.add(ArtistCardModel.fromJson(json));
        }
        return artists;
      });
}
