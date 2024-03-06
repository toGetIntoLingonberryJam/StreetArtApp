import 'package:street_art_witnesses/core/utils/error_handler.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/data/providers/artworks/provider.dart';

class NetworkArtworksProvider with ErrorHandler implements ArtworksProvider {
  @override
  Future<Artwork?> getArtworkById(int id) async => handleApiRequest(
        BackendApi.get('/v1/artworks/$id'),
        onResult: (r) => Artwork.fromJson(r.data),
      );

  @override
  Future<List<ArtworkLocation>?> getArtworkLocations() async =>
      handleApiRequest(BackendApi.get('/v1/artworks/locations'), onResult: (r) {
        final locations = <ArtworkLocation>[];
        for (var json in r.data) {
          locations.add(ArtworkLocation.fromJson(json));
        }
        return locations;
      });
}
