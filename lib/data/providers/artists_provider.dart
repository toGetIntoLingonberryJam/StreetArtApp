import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';

abstract class ArtistsProvider {
  static Future<Artist> getArtistById(int artistId) async {
    final response = await BackendApi.get('/v1/artists/$artistId');
    return Artist.fromJson(response.data);
  }

  static Future<List<ArtistPreview>?> getArtists({
    int page = 1,
    int size = 20,
    String? search,
    String? orderBy,
  }) async {
    final response = await BackendApi.get('/v1/artists');
    final artists = <ArtistPreview>[];

    for (var json in response.data['items']) {
      artists.add(ArtistPreview.fromJson(json));
    }
    return artists;
  }
}
