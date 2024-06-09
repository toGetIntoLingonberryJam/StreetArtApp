import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

enum _Keys { token, imageQuality }

class LocalStoreDataSource {
  LocalStoreDataSource._(this._settingsBox, this.cacheDirectoryPath);
  final Box<String> _settingsBox;
  final String cacheDirectoryPath;

  static Future<void> init() async {
    final box = await Hive.openBox<String>('settings');
    final cacheDir = kIsWeb ? '/assets' : (await getTemporaryDirectory()).path;
    instance = LocalStoreDataSource._(box, cacheDir);
  }

  static late final LocalStoreDataSource instance;

  void deleteData() {
    _settingsBox.clear();
  }

  String? getToken() => _settingsBox.get(_Keys.token.name);
  void setToken(String token) => _settingsBox.put(_Keys.token.name, token);

  String? getImageQuality() => _settingsBox.get(_Keys.imageQuality.name);
  void setImageQuality(String quality) => _settingsBox.put(_Keys.imageQuality.name, quality);
}
