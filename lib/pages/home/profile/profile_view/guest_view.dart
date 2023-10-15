import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/auth/auth_page.dart';
import 'package:street_art_witnesses/src/widgets/skeleton.dart';

class GuestView extends StatelessWidget {
  const GuestView({super.key});

  void _login(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const AuthPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(image: AssetImage('assets/sad_face.png')),
                const SizedBox(height: 50),
                const Text(
                  'Вы не авторизованы!',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () => _login(context),
                  child: const Text(
                    'Войти в профиль',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _settingsTile('Настройки'),
            _settingsTile('О нас'),
          ],
        ),
      ],
    );
  }

  ListTile _settingsTile(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const Skeleton(size: 30, borderRadius: 0),
      title: Text(title, style: const TextStyle(fontSize: 17)),
    );
  }
}
