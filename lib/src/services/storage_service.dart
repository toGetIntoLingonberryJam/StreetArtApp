import 'package:localstore/localstore.dart';
import 'package:street_art_witnesses/src/utils/debugging.dart';

abstract class StorageService {
  static final _db = Localstore.instance;
  static CollectionRef get _collection =>
      _db.collection('street_art_witnesses');

  static Future<String?> retrieveToken() async {
    final userJson = await _collection.doc('user').get();
    Debug.log('[RETRIEVING TOKEN]: ${userJson?['token']}');

    return userJson?['token'];
  }

  static Future<void> saveToken(String token) async {
    await _collection.doc('user').set({
      'token': token,
    });
    Debug.log('[SAVED TOKEN]: $token');
  }

  static Future<void> deleteUserInfo() async {
    await _collection.doc('user').delete();
    Debug.log('[TOKEN DELETED]');
  }
}
