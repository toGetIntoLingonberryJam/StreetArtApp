import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/intro/intro_slider.dart';
import 'package:street_art_witnesses/src/models/user/guest_user.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  // Synchronizing user
  await Future.delayed(const Duration(seconds: 1));

  runApp(const MyApp());
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
        title: 'StreetArt Witnesses',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const IntroSlider(),
      ),
    );
  }
}
