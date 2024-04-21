import 'package:street_art_witnesses/core/utils/error_handler.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location/artwork_location.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';

abstract class ArtworksProvider {
  static Future<Artwork?> getArtworkById(int id) async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/artworks/$id'),
      onResult: (r) => Artwork.fromJson(r.data),
    );
  }

  static Future<List<ArtworkPreview>?> getArtworksOfAuthor(int artistId) async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/artists/$artistId/artworks'),
      onResult: (r) {
        final artworks = <ArtworkPreview>[];
        for (final json in r.data['items']) {
          artworks.add(ArtworkPreview.fromJson(json));
        }
        return artworks;
      },
    );
  }

  static Future<List<ArtworkPreview>?> getArtworksOfFestival(int festivalId) async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/festivals/$festivalId/artworks', queryParameters: {
        'size': 50,
        'page': 1,
      }),
      onResult: (r) {
        final artworks = <ArtworkPreview>[];
        for (final json in r.data['items']) {
          artworks.add(ArtworkPreview.fromJson(json));
        }
        return artworks;
      },
    );
  }

  static Future<List<ArtworkLocation>?> getArtworkLocations() async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/artworks/locations'),
      onResult: (r) {
        final locations = <ArtworkLocation>[];
        for (final json in r.data) {
          locations.add(ArtworkLocation.fromJson(json));
        }
        return locations;
      },
    );
  }
}
