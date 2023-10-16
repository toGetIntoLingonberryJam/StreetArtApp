import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/auth/auth_page.dart';
import 'package:street_art_witnesses/pages/home/home_page.dart';

class IntroAuthPage extends StatelessWidget {
  const IntroAuthPage({super.key, required this.content});

  final String content;

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => const HomePage(),
    ));
  }

  void _navigateToAuth(BuildContext context) {
    _navigateToHome(context);

    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const AuthPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Expanded(
                flex: 4,
                child: Image(image: AssetImage('assets/logo.png')),
              ),
              const SizedBox(height: 40),
              const Text(
                'Свидетели Стрит-Арта',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                content,
                style: const TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              const Expanded(flex: 2, child: SizedBox()),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size(300, 45),
                ),
                onPressed: () => _navigateToAuth(context),
                child: const Text('Войти в профиль',
                    style: TextStyle(fontSize: 17)),
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
      ),
    );
  }
}
