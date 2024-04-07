import 'package:street_art_witnesses/core/utils/error_handler.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location/artwork_location.dart';

abstract class ArtworksProvider {
  static Future<Artwork?> getArtworkById(int id) async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/artworks/$id'),
      onResult: (r) => Artwork.fromJson(r.data),
    );
  }

  static Future<List<ArtworkLocation>?> getArtworkLocations() async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/artworks/locations'),
      onResult: (r) {
        final locations = <ArtworkLocation>[];
        for (var json in r.data) {
          locations.add(ArtworkLocation.fromJson(json));
        }
        return locations;
      },
    );
  }
}
