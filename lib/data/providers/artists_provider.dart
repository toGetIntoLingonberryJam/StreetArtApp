import 'package:street_art_witnesses/core/utils/error_handler.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';

abstract class ArtistsProvider {
  static Future<Artist?> getArtistById(int artistId) async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/artists/$artistId'),
      onResult: (r) => Artist.fromJson(r.data),
    );
  }

  static Future<List<ArtistPreview>?> getArtists({
    int page = 1,
    int size = 20,
    String? search,
    String? orderBy,
  }) async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/artists'),
      onResult: (r) {
        final artists = <ArtistPreview>[];
        for (final json in r.data['items']) {
          artists.add(ArtistPreview.fromJson(json));
        }
        return artists;
      },
    );
  }
}
