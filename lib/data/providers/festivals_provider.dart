import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/festival/festival.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';

abstract class FestivalsProvider {
  static Future<Festival?> getFestivalById(int artistId) async {
    return await handleRequest(
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
    return await handleRequest(
      BackendApi.get('/v1/festivals'),
      onResult: (r) {
        final fests = <FestivalPreview>[];
        for (final json in r.data['items']) {
          fests.add(FestivalPreview.fromJson(json));
        }
        return fests;
      },
    );
  }
}
