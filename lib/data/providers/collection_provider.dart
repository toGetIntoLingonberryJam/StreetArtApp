import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';

enum CollectionType { artworks, artists, festivals }

abstract class CollectionProvider {
  static Future<bool?> toggleLike(CollectionType collType, int id) async {
    final token = Get.find<AuthService>().user.value.token;
    if (token == null) return null;

    return await handleRequest(
      BackendApi.post('/v1/${collType.name}/$id/toggle_like', options: Options(headers: {'Authorization': 'Bearer $token'})),
      onResult: (r) => r.data as bool,
    );
  }

  static Future<List<ArtworkPreview>?> loadArtworks() async {
    final token = Get.find<AuthService>().user.value.token;
    if (token == null) return null;

    return await handleRequest(
      BackendApi.get('/v1/collection/artworks', options: Options(headers: {'Authorization': 'Bearer $token'})),
      onResult: (r) {
        final previews = <ArtworkPreview>[];
        for (final json in r.data) {
          previews.add(ArtworkPreview.fromJson(json));
        }
        return previews;
      },
    );
  }

  static Future<List<ArtistPreview>?> loadArtists() async {
    return await handleRequest(
      BackendApi.get('/v1/collection/artists'),
      onResult: (r) {
        final previews = <ArtistPreview>[];
        for (final json in r.data) {
          previews.add(ArtistPreview.fromJson(json));
        }
        return previews;
      },
    );
  }

  static Future<List<FestivalPreview>?> loadFestivals() async {
    return await handleRequest(
      BackendApi.get('/v1/collection/festivals'),
      onResult: (r) {
        final previews = <FestivalPreview>[];
        for (final json in r.data) {
          previews.add(FestivalPreview.fromJson(json));
        }
        return previews;
      },
    );
  }
}
