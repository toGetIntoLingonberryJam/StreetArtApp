import 'package:street_art_witnesses/core/utils/error_handler.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/providers/artists/provider.dart';

class NetworkArtistsProvider with ErrorHandler implements ArtistsProvider {
  @override
  Future<ArtistPreview?> getArtistById(int artistId) async => handleApiRequest(
        BackendApi.get('/v1/artists/$artistId'),
        onResult: (r) => ArtistPreview.fromJson(r.data),
      );

  @override
  Future<List<ArtistPreview>?> getArtists({
    int page = 1,
    int size = 20,
    String? search,
    String? orderBy,
  }) async =>
      handleApiRequest(BackendApi.get('/v1/artists'), onResult: (r) {
        final artists = <ArtistPreview>[];
        for (var json in r.data['items']) {
          artists.add(ArtistPreview.fromJson(json));
        }
        return artists;
      });
}
