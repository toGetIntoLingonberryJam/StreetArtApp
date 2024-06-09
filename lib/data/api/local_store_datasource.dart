import 'package:hive/hive.dart';

enum _Keys { token, imageQuality }

class LocalStoreDataSource {
  LocalStoreDataSource._(this._settingsBox);
  final Box<String> _settingsBox;

  static Future<void> init() async {
    final box = await Hive.openBox<String>('settings');
    instance = LocalStoreDataSource._(box);
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
