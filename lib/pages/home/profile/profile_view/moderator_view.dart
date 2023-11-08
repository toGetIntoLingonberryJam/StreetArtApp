import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/src/widgets/profile_tile.dart';
import 'package:street_art_witnesses/src/widgets/settings_tile.dart';

class ModeratorView extends StatelessWidget {
  const ModeratorView({super.key});

  void _logout(BuildContext context) async {
    final isLogout = await Utils.showWarning(
          context,
          title: 'Выйти из аккаунта',
          content:
              'Вы уверены, что хотите выйти из аккаунта? Это действие нельзя будет отменить.',
        ) ??
        false;

    if (context.mounted && isLogout) {
      await Utils.showLoading(
        context,
        context.read<UserProvider>().logout(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>().user;

    return SingleChildScrollView(
      padding: kDefaultPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileTile(
            username: user.username,
            email: user.email!,
          ),
          const SizedBox(height: 24),
          const SettingsTile(
            iconData: Icons.assignment_ind,
            text: 'Аккаунт модератора',
          ),
          const SizedBox(height: 24),
          const SettingsTile(
            iconData: Icons.add_circle_outline,
            text: 'Добавить работу',
          ),
          const SizedBox(height: 8),
          const SettingsTile(
            iconData: Icons.collections_outlined,
            text: 'Мои публикации',
          ),
          const SizedBox(height: 8),
          const SettingsTile(
            iconData: Icons.filter_list,
            text: 'Заявки на публикацию',
            notificationsCount: 100,
          ),
          const SizedBox(height: 8),
          const SettingsTile(
            iconData: Icons.settings_outlined,
            text: 'Настройки',
          ),
          const SizedBox(height: 8),
          const SettingsTile(
            iconData: Icons.info_outline,
            text: 'О нас',
          ),
          const SizedBox(height: 8),
          SettingsTile(
            iconData: Icons.logout,
            text: 'Выйти',
            onTap: () => _logout(context),
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }
}
