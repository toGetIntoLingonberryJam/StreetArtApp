import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/data/models/author/author.dart';

abstract class ArtworkService {
  static Future<List<Author>> getMockAuthors() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockAuthors;
  }

  static Future<List<Artwork>> getMockArtworks() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockArtworks;
  }

  static Future<Artwork?> getArtworkById(int id) async {
    final response = await BackendApi.get('/v1/artworks/$id');

    if (response == null) {
      return null;
    } else {
      final Map<String, dynamic> data = response.data!;
      return Artwork.fromJson(data);
    }
  }

  static Future<List<ArtworkLocation>?> getLocations() async {
    final response = await BackendApi.get('/v1/artworks/locations');

    if (response == null) {
      return null;
    } else {
      final List<ArtworkLocation> locations = [];
      final List<dynamic> dataList = response.data;

      for (final locationData in dataList) {
        locations.add(ArtworkLocation.fromJson(locationData));
      }
      return locations;
    }
  }
}

const mockAuthors = [
  Author(
    name: 'Покрас Лампас',
    thumbnailUrl: null,
  ),
  Author(
    name: 'Roma Bantik',
    thumbnailUrl: null,
  ),
  Author(
    name: 'Philippenzo',
    thumbnailUrl: null,
  ),
];

const mockArtworks = <Artwork>[];
