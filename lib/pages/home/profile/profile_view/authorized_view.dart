import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/models/user/guest_user.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/widgets/skeleton.dart';

class AuthorizedView extends StatelessWidget {
  const AuthorizedView({super.key});

  void _logout(BuildContext context) {
    final user = GuestUser();

    context.read<UserProvider>().updateUser(user);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>().user;

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                user.email!,
                style: const TextStyle(fontSize: 24),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Вы авторизованы!',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () => _logout(context),
                  child: const Text(
                    'Выйти из профиля',
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
