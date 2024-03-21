import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location/artwork_location.dart';

abstract class ArtworksProvider {
  static Future<Artwork> getArtworkById(int id) async {
    final response = await BackendApi.get('/v1/artworks/$id');
    return Artwork.fromJson(response.data);
  }

  static Future<List<ArtworkLocation>?> getArtworkLocations() async {
    final response = await BackendApi.get('/v1/artworks/locations');
    final locations = <ArtworkLocation>[];
    for (var json in response.data) {
      locations.add(ArtworkLocation.fromJson(json));
    }
    return locations;
  }
}
