import 'package:street_art_witnesses/src/blocs/settings/settings_cubit.dart';
import 'package:street_art_witnesses/src/data/local_store_datasource.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

abstract class LocalStoreService {
  static Future<String?> retrieveToken() async {
    final userJson = await LocalStoreDataSource.userDoc.get();
    final String? token = userJson?['token'];

    if (token != null) {
      Logger.success('[TOKEN RETRIEVED]: ${userJson?['token']}');
      return token;
    }
    Logger.warning('[TOKEN RETRIEVING]: no token found.');
    return null;
  }

  static Future<void> saveToken(String token) async {
    await LocalStoreDataSource.userDoc.set({
      'token': token,
    });
    Logger.success('[TOKEN SAVED]: $token');
  }

  static Future<ImageQuality> getImageQuality() async {
    final settingsJson = await LocalStoreDataSource.settingsDoc.get();
    final String? qualityName = settingsJson?['image_quality'];
    final ImageQuality? quality = _mapNameToImgQuality[qualityName];

    return quality ?? ImageQuality.good;
  }

  static Future<void> setImageQuality(ImageQuality quality) async {
    await LocalStoreDataSource.settingsDoc.set({
      'image_quality': quality.name,
    });
    Logger.message('[IMAGE_QUALITY SET]: $quality');
  }
}

const _mapNameToImgQuality = {
  'preview': ImageQuality.preview,
  'bad': ImageQuality.bad,
  'good': ImageQuality.good,
  'best': ImageQuality.best,
};
