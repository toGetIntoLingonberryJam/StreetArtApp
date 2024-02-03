import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/home/home_page.dart';
import 'package:street_art_witnesses/modules/intro/intro_slider.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/src/blocs/main_menu/main_menu_cubit.dart';
import 'package:street_art_witnesses/src/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/src/blocs/settings/settings_cubit.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/providers/location_provider.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';
import 'package:street_art_witnesses/core/values/theme.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final quality = await LocalStoreService.getImageQuality();
  final token = await LocalStoreService.retrieveToken();
  final user = token == null ? User.guest() : await UserService.authenticate(token: token);

  Get.lazyPut(() => UserService(user: user), fenix: true);
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

    final User user = Get.find<ProfileController>().user;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmailCounterProvider(length: 30)),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        BlocProvider(create: (_) => SettingsCubit(initImageQuality: initImageQuality)),
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
