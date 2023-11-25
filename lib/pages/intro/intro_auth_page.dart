import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/auth/auth_page.dart';
import 'package:street_art_witnesses/pages/home/home_page.dart';
import 'package:street_art_witnesses/src/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/src/widgets/app_logo.dart';

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
                child: AppLogo(),
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
              AppButton.primary(
                onTap: () => _navigateToAuth(context),
                child: const Text('Войти в профиль'),
              ),
              const SizedBox(height: 12),
              AppButton.secondary(
                onTap: () => _navigateToHome(context),
                child: const Text('Позже'),
              ),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
