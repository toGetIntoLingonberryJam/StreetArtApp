import 'package:street_art_witnesses/src/data/local_store_datasource.dart';
import 'package:street_art_witnesses/src/utils/custom_logger.dart';

abstract class LocalStoreService {
  static Future<String?> retrieveToken() async {
    final userJson = await LocalStoreDataSource.userDoc.get();
    final String? token = userJson?['token'];

    if (token != null) {
      CustomLogger.showSuccess('[TOKEN RETRIEVED]: ${userJson?['token']}');
      return token;
    }
    CustomLogger.showWarning('[TOKEN RETRIEVING]: no token found.');
    return null;
  }

  static Future<void> saveToken(String token) async {
    await LocalStoreDataSource.userDoc.set({
      'token': token,
    });
    CustomLogger.showSuccess('[TOKEN SAVED]: $token');
  }

  static Future<void> deleteUserInfo() async {
    await LocalStoreDataSource.userDoc.delete();
    CustomLogger.showWarning('[USER DOCREF DELETED]');
  }
}
