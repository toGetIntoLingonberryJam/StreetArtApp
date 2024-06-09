import 'package:get/get.dart';
import 'package:street_art_witnesses/data/services/local_store_service.dart';

enum ImageQuality { preview, bad, good, best }

enum ShowPages { moderationWarning }

class SettingsService extends GetxService {
  SettingsService({required ImageQuality initImageQuality}) : _imageQuality = initImageQuality.obs;

  // Image Quality
  final Rx<ImageQuality> _imageQuality;
  ImageQuality get imageQuality => _imageQuality.value;

  void setImageQuality(ImageQuality quality) {
    LocalStoreService.setImageQuality(quality);
    _imageQuality.value = quality;
  }

  // Don't show again pages
  final Map<ShowPages, bool> _showPages = {
    ShowPages.moderationWarning: true,
  };

  bool isShowing(ShowPages page) => _showPages[page] ?? true;
  void dontShowAgain(ShowPages page) => _showPages[page] = false;
}
