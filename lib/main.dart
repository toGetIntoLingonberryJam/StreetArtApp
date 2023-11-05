import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:street_art_witnesses/pages/home/home_page.dart';
import 'package:street_art_witnesses/pages/intro/intro_slider.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/providers/favourites_provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/api_service.dart';
import 'package:street_art_witnesses/src/services/storage_service.dart';
import 'package:street_art_witnesses/theme.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

Future<User> getUser() async {
  // Retrieve token from localstore, if exists
  final token = await StorageService.retrieveToken();

  if (token != null) {
    final user = await ApiService.getUserByToken(token: token);
    return user;
  }

  return User.guest();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await getUser();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    // enabled: false,
    builder: (context) => MyApp(user: user),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.user});

  final User user;

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
          create: (_) => FavouritesProvider(),
        ),
      ],
      child: MaterialApp(
        // TODO: Remove in production
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        // Do not touch this
        scaffoldMessengerKey: Utils.messengerKey,
        title: 'Свидетели Стрит-Арта',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: user.isAuthorized ? const HomePage() : const IntroSlider(),
      ),
    );
  }
}
