import 'package:street_art_witnesses/core/utils/error_handler.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/festival/festival.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';

abstract class FestivalsProvider {
  static Future<Festival?> getFestivalById(int artistId) async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/festivals/$artistId'),
      onResult: (r) => Festival.fromJson(r.data),
    );
  }

  static Future<List<FestivalPreview>?> getFestivals({
    int page = 1,
    int size = 20,
    String? search,
    String? orderBy,
  }) async {
    return await ApiHandler.handleApiRequest(
      BackendApi.get('/v1/festivals/locations'),
      onResult: (r) {
        final fests = <FestivalPreview>[];
        for (final json in r.data) {
          fests.add(FestivalPreview.fromJson(json));
        }
        return fests;
      },
    );
  }
}
