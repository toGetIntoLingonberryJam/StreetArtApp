import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/data/api/local_store_datasource.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';

abstract class LocalStoreService {
  static Future<String?> retrieveToken() async {
    final userJson = await LocalStoreDataSource.userDoc.get();
    final String? token = userJson?['token'];

    if (token != null) {
      Logger.s('local token: ${userJson?['token']}');
      return token;
    }
    Logger.w('could not find local token');
    return null;
  }

  static Future<void> saveToken(String token) async {
    await LocalStoreDataSource.userDoc.set({
      'token': token,
    });
    Logger.s('token saved to local: $token');
  }

  static Future<ImageQuality> getImageQuality() async {
    final settingsJson = await LocalStoreDataSource.settingsDoc.get();
    final String? qualityName = settingsJson?['image_quality'];
    final quality = _mapNameToImgQuality[qualityName];

    return quality ?? ImageQuality.good;
  }

  static Future<void> setImageQuality(ImageQuality quality) async {
    await LocalStoreDataSource.settingsDoc.set({
      'image_quality': quality.name,
    });
    Logger.d('image-quality set to $quality');
  }
}

const _mapNameToImgQuality = {
  'preview': ImageQuality.preview,
  'bad': ImageQuality.bad,
  'good': ImageQuality.good,
  'best': ImageQuality.best,
};
