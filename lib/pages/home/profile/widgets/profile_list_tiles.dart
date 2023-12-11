import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/pages/home/profile/about_page.dart';
import 'package:street_art_witnesses/pages/home/profile/settings_page.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/containers/app_list_tile.dart';

abstract class UserTiles {
  static AppListTile settings(BuildContext context) => AppListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        )),
        iconData: Icons.settings_outlined,
        text: 'Настройки',
      );

  static AppListTile about(BuildContext context) => AppListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const AboutPage(),
        )),
        iconData: Icons.info_outline,
        text: 'О нас',
      );

  static AppListTile logout(BuildContext context) => AppListTile(
        onTap: () => _logout(context),
        iconData: Icons.logout,
        text: 'Выйти',
        foregroundColor: Theme.of(context).colorScheme.error,
      );

  static AppListTile publications(BuildContext context) => const AppListTile(
        iconData: Icons.collections_outlined,
        text: 'Мои публикации',
        notificationsCount: 1,
      );

  static AppListTile publicationApplications(BuildContext context) =>
      const AppListTile(
        iconData: Icons.filter_list,
        text: 'Заявки на публикацию',
        notificationsCount: 100,
      );

  static AppListTile addArtwork(BuildContext context) => const AppListTile(
        iconData: Icons.add_circle_outline,
        text: 'Добавить работу',
      );
}

void _logout(BuildContext context) async {
  final isLogout = await Utils.showWarning(
        context,
        title: 'Выйти из аккаунта',
        content: 'Вы уверены, что хотите выйти из аккаунта?',
      ) ??
      false;

  if (context.mounted && isLogout) {
    await Utils.showLoading(
      context,
      context.read<UserProvider>().logout(),
    );
  }
}
