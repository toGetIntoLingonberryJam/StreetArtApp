import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/applications/screen.dart';
import 'package:street_art_witnesses/modules/user/screens/about.dart';
import 'package:street_art_witnesses/modules/user/screens/change_password.dart';
import 'package:street_art_witnesses/modules/user/screens/settings/screen.dart';
import 'package:street_art_witnesses/modules/moderation/moderation_page.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/containers/app_list_tile.dart';

abstract class UserTiles {
  static AppListTile settings(BuildContext context) => AppListTile(
        onTap: () => Get.to(() => const SettingsScreen()),
        iconData: Icons.settings_outlined,
        text: 'Настройки',
      );

  static AppListTile about(BuildContext context) => AppListTile(
        onTap: () => Get.to(() => const AboutPage()),
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

  static AppListTile applications(BuildContext context) => AppListTile(
        onTap: () => Get.to(() => const ApplicationsScreen()),
        iconData: Icons.filter_list,
        text: 'Заявки на публикацию',
        notificationsCount: 100,
      );

  static AppListTile addArtwork(BuildContext context) => AppListTile(
        onTap: () => Get.to(() => const ModerationPage()),
        iconData: Icons.add_circle_outline,
        text: 'Добавить работу',
      );

  static AppListTile changePassword(BuildContext context) => AppListTile(
        onTap: () => Get.to(() => const ChangePasswordPage()),
        iconData: Icons.lock_person_outlined,
        text: 'Изменить пароль',
      );
}

void _logout(BuildContext context) async {
  final isLogout = await Utils.of(context).showWarning(
        title: 'Выйти из аккаунта',
        content: 'Вы уверены, что хотите выйти из аккаунта?',
      ) ??
      false;

  if (context.mounted && isLogout) {
    await Utils.of(context).showLoading(Get.find<AuthService>().logout());
  }
}
