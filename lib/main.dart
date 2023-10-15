import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/intro/intro_slider.dart';
import 'package:street_art_witnesses/src/models/user/guest_user.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/theme.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

void main() async {
  // TODO: User synchronization
  await Future.delayed(const Duration(seconds: 1));

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(user: GuestUser()),
          lazy: false,
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
        theme: appTheme,
        home: const IntroSlider(),
      ),
    );
  }
}
