import 'package:localstore/localstore.dart';

abstract class LocalStoreDataSource {
  static final _db = Localstore.instance;
  static CollectionRef get _collection =>
      _db.collection('street_art_witnesses');

  static DocumentRef get userDoc => _collection.doc('user');

  static DocumentRef get settingsDoc => _collection.doc('settings');
}
