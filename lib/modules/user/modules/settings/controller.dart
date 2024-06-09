import 'package:get/get.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';

class SettingsController extends GetxController {
  final _settingsService = Get.find<SettingsService>();

  ImageQuality get imageQuality => _settingsService.imageQuality;

  void setImageQuality(ImageQuality quality) {
    _settingsService.setImageQuality(quality);
    update();
  }
}
