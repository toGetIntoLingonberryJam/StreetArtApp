import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/models/user.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/data/services/local_store_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/auth/check_email/controller.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/modules/home/screen.dart';
import 'package:street_art_witnesses/modules/intro/intro_slider.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/core/values/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final quality = await LocalStoreService.getImageQuality();
  ansiColorDisabled = false;

  await Get.putAsync(() async {
    final service = AuthService();
    await service.init();
    return service;
  }, permanent: true);
  Get.put(SettingsService(initImageQuality: quality));
  Get.put(GetMapController(), permanent: true);
  Get.put(ProfileController(), permanent: true);
  Get.put(CollectionController(), permanent: true);
  Get.put(EmailCounterController(durationInSeconds: 30), permanent: true);

  runApp(MyApp(initImageQuality: quality));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initImageQuality});

  final ImageQuality initImageQuality;

  @override
  Widget build(BuildContext context) {
    // Prevents device orientation changes
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final User user = Get.find<AuthService>().user.value;

    return GetMaterialApp(
      title: 'Свидетели',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: user.isAuthorized ? const HomeScreen() : const IntroSlider(),
    );
  }
}
