import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/data/api/local_store_datasource.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';

abstract class LocalStoreService {
  static Future<String?> retrieveToken() async {
    final token = LocalStoreDataSource.instance.getToken();

    if (token != null) {
      Logger.s('local token: $token');
      return token;
    }
    Logger.w('could not find local token');
    return null;
  }

  static Future<void> saveToken(String token) async {
    LocalStoreDataSource.instance.setToken(token);
    Logger.s('token saved to local: $token');
  }

  static Future<ImageQuality> getImageQuality() async {
    final qualityName = LocalStoreDataSource.instance.getImageQuality();
    final quality = _mapNameToImgQuality[qualityName];
    return quality ?? ImageQuality.good;
  }

  static void setImageQuality(ImageQuality quality) {
    LocalStoreDataSource.instance.setImageQuality(quality.name);
    Logger.d('image-quality set to $quality');
  }
}

const _mapNameToImgQuality = {
  'preview': ImageQuality.preview,
  'bad': ImageQuality.bad,
  'good': ImageQuality.good,
  'best': ImageQuality.best,
};
