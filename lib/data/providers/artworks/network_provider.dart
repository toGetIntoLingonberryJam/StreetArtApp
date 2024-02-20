import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/data/providers/artworks/provider.dart';

class NetworkArtworksProvider implements ArtworksProvider {
  @override
  Future<Artwork?> getArtworkById(int id) async {
    final response = await BackendApi.get('/v1/artworks/$id');
    if (response == null) return null;

    final Map<String, dynamic> data = response.data!;
    return Artwork.fromJson(data);
  }

  @override
  Future<List<ArtworkLocation>?> getArtworkLocations() async {
    final response = await BackendApi.get('/v1/artworks/locations');
    if (response == null) return null;

    final List<ArtworkLocation> locations = [];

    for (final locationData in response.data) {
      locations.add(ArtworkLocation.fromJson(locationData));
    }
    return locations;
  }
}
