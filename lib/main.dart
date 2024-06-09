import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/core/values/theme.dart';
import 'package:street_art_witnesses/data/api/local_store_datasource.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/data/services/local_store_service.dart';
import 'package:street_art_witnesses/data/services/package_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/auth/check_email/controller.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/modules/home/screen.dart';
import 'package:street_art_witnesses/modules/intro/intro_slider.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ansiColorDisabled = false;

  await Hive.initFlutter();
  await LocalStoreDataSource.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Prevents device orientation changes
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      title: 'Стрит-Арт',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const InitLoadingScreen(),
    );
  }
}

class InitLoadingScreen extends StatefulWidget {
  const InitLoadingScreen({super.key});

  @override
  State<InitLoadingScreen> createState() => _InitLoadingScreenState();
}

class _InitLoadingScreenState extends State<InitLoadingScreen> {
  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final quality = await LocalStoreService.getImageQuality();
    final packageInfo = await PackageInfo.fromPlatform();

    await Get.putAsync(() async {
      final service = AuthService();
      await service.init();
      return service;
    }, permanent: true);
    Get.put(PackageInfoService(initInfo: packageInfo));
    Get.put(SettingsService(initImageQuality: quality));
    Get.put(GetMapController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(CollectionController()..loadAll(), permanent: true);
    Get.put(EmailCounterController(durationInSeconds: 30), permanent: true);

    final user = Get.find<AuthService>().user.value;
    Get.off(() => user.isAuthorized ? const HomeScreen() : const IntroSlider());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: UIColors.greyButton, borderRadius: BorderRadius.all(Radius.circular(16))),
              child: const AppLogo(),
            ),
            const SizedBox(width: Paddings.normal),
            const Text('Свидетели\nСтрит-Арта', style: NewTextStyles.title2Semibold, maxLines: 2),
          ],
        ),
      ),
    );
  }
}
