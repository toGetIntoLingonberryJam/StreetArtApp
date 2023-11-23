import 'package:localstore/localstore.dart';
import 'package:street_art_witnesses/src/utils/custom_logger.dart';

abstract class StorageService {
  static final _db = Localstore.instance;
  static CollectionRef get _collection =>
      _db.collection('street_art_witnesses');

  static Future<String?> retrieveToken() async {
    final userJson = await _collection.doc('user').get();
    final String? token = userJson?['token'];

    if (token != null) {
      CustomLogger.showSuccess('[TOKEN RETRIEVED]: ${userJson?['token']}');
      return token;
    }
    CustomLogger.showWarning('[TOKEN RETRIEVING]: no token found.');
    return null;
  }

  static Future<void> saveToken(String token) async {
    await _collection.doc('user').set({
      'token': token,
    });
    CustomLogger.showSuccess('[TOKEN SAVED]: $token');
  }

  static Future<void> deleteUserInfo() async {
    await _collection.doc('user').delete();
    CustomLogger.showWarning('[TOKEN DELETED]');
  }
}
