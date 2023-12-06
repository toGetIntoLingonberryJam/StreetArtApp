import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:street_art_witnesses/pages/home/home_page.dart';
import 'package:street_art_witnesses/pages/intro/intro_slider.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/providers/settings_provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';
import 'package:street_art_witnesses/theme.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

Future<User> getUser() async {
  // Retrieve token from localstore, if exists
  final token = await LocalStoreService.retrieveToken();

  if (token != null) {
    final user = await UserService.getUserViaToken(token: token);
    return user;
  }

  return User.guest();
}

Future<ImageQuality> getImageQuality() async =>
    await LocalStoreService.getImageQuality();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await getUser();
  final quality = await getImageQuality();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (_) => MyApp(
      user: user,
      initImageQuality: quality,
    ),
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
        ChangeNotifierProvider(
          create: (_) => UserProvider(user: user),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsProvider(initImageQuality: initImageQuality),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => EmailCounterProvider(length: 30)),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        scaffoldMessengerKey: Utils.messengerKey,
        title: 'Свидетели',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: user.isAuthorized ? const HomePage() : const IntroSlider(),
      ),
    );
  }
}
