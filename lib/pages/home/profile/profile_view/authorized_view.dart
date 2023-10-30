import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/src/widgets/app_button.dart';
import 'package:street_art_witnesses/src/widgets/skeleton.dart';

class AuthorizedView extends StatelessWidget {
  const AuthorizedView({super.key});

  void _logout(BuildContext context) async {
    await Utils.showLoading(
      context,
      context.read<UserProvider>().logout(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>().user;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 16),
            Expanded(
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
                AppButton.primary(
                  onTap: () => _logout(context),
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
