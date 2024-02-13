import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/blocs/main_menu/main_menu_cubit.dart';
import 'package:street_art_witnesses/data/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/data/models/user.dart';
import 'package:street_art_witnesses/data/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/data/providers/location_provider.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/data/services/local_store_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/home/home_page.dart';
import 'package:street_art_witnesses/modules/intro/intro_slider.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/core/values/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final quality = await LocalStoreService.getImageQuality();

  await Get.putAsync(
    () async {
      final service = AuthService();
      await service.init();
      return service;
    },
    permanent: true,
  );
  Get.put(SettingsService(initImageQuality: quality));
  Get.put(ProfileController(), permanent: true);

  runApp(
    MyApp(initImageQuality: quality),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    // builder: (_) => MyApp(user: user, initImageQuality: quality),
    // ),
  );
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmailCounterProvider(length: 30)),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        BlocProvider(create: (_) => MapCubit()..loadMarkers()),
        BlocProvider(create: (_) => MainMenuCubit()),
      ],
      child: GetMaterialApp(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        title: 'Свидетели',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: user.isAuthorized ? const HomePage() : const IntroSlider(),
      ),
    );
  }
}
