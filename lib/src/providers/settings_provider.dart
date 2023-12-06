import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';

enum ImageQuality { preview, bad, good, best }

class SettingsProvider with ChangeNotifier {
  SettingsProvider({required ImageQuality initImageQuality})
      : _imageQuality = initImageQuality;

  ImageQuality _imageQuality;
  ImageQuality get imageQuality => _imageQuality;

  void setImageQuality(ImageQuality quality) async {
    await LocalStoreService.setImageQuality(quality);
    _imageQuality = quality;
    notifyListeners();
  }
}
