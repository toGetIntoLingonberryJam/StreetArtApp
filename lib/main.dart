import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_art_witnesses/pages/home/home_page.dart';
import 'package:street_art_witnesses/pages/intro/intro_slider.dart';
import 'package:street_art_witnesses/src/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/src/blocs/settings/settings_cubit.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/providers/location_provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';
import 'package:street_art_witnesses/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await UserProvider.getCurrentUser();
  final quality = await LocalStoreService.getImageQuality();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (_) => MyApp(user: user, initImageQuality: quality),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.user,
    required this.initImageQuality,
  });

  final User user;
  final ImageQuality initImageQuality;

  @override
  Widget build(BuildContext context) {
    // Prevents device orientation changes
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(user: user), lazy: false),
        ChangeNotifierProvider(create: (_) => EmailCounterProvider(length: 30)),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        BlocProvider(create: (_) => SettingsCubit(initImageQuality: initImageQuality)),
        BlocProvider(create: (_) => MapCubit()),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Свидетели',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: user.isAuthorized ? const HomePage() : const IntroSlider(),
      ),
    );
  }
}
