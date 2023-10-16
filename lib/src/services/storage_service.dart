import 'package:localstore/localstore.dart';

abstract class StorageService {
  static final _db = Localstore.instance;
  static CollectionRef get _collection =>
      _db.collection('street_art_witnesses');

  static Future<String?> retrieveToken() async {
    final userJson = await _collection.doc('user').get();
    return userJson?['token'];
  }

  static Future<void> saveToken(String token) async {
    await _collection.doc('user').set({
      'token': token,
    });
  }

  static Future<void> deleteUserInfo() async {
    await _collection.doc('user').delete();
  }
}
