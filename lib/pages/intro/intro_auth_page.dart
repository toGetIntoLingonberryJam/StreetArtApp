import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/home_page.dart';

class IntroAuthPage extends StatelessWidget {
  const IntroAuthPage({super.key});

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => const HomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Image(image: AssetImage('assets/logo.png')),
            const SizedBox(height: 40),
            const Text(
              'Street Art Witnesses',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
            const Expanded(flex: 2, child: SizedBox()),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(300, 45),
              ),
              onPressed: () => _navigateToHome(context),
              child:
                  const Text('Войти в профиль', style: TextStyle(fontSize: 17)),
            ),
            const SizedBox(height: 10),
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                minimumSize: const Size(300, 45),
              ),
              onPressed: () => _navigateToHome(context),
              child: const Text('Позже', style: TextStyle(fontSize: 17)),
            ),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
