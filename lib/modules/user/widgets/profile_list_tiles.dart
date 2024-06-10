import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/applications/screen.dart';
import 'package:street_art_witnesses/modules/moderation/screens/warning.dart';
import 'package:street_art_witnesses/modules/user/modules/about.dart';
import 'package:street_art_witnesses/modules/user/modules/change_password.dart';
import 'package:street_art_witnesses/modules/user/modules/settings/screen.dart';
import 'package:street_art_witnesses/widgets/containers/app_list_tile.dart';

abstract class UserTiles {
  static AppListTile settings(BuildContext context) => AppListTile(
        onTap: () => openScreen(const SettingsScreen()),
        iconData: Icons.settings_outlined,
        text: 'Настройки',
      );

  static AppListTile about(BuildContext context) => AppListTile(
        onTap: () => openScreen(const AboutPage()),
        iconData: Icons.info_outline,
        text: 'О нас',
      );

  static AppListTile logout(BuildContext context) => AppListTile(
        onTap: () => _logout(context),
        iconData: Icons.logout,
        text: 'Выйти',
        foregroundColor: UIColors.error,
      );

  static AppListTile publications(BuildContext context) => const AppListTile(
        iconData: Icons.collections_outlined,
        text: 'Мои публикации',
        notificationsCount: 1,
      );

  static AppListTile applications(BuildContext context) => AppListTile(
        onTap: () => openScreen(const ApplicationsScreen()),
        iconData: Icons.filter_list,
        text: 'Заявки на публикацию',
        notificationsCount: 100,
      );

  static AppListTile addArtwork(BuildContext context) => AppListTile(
        onTap: () => openScreen(const ModerationWarningScreen()),
        iconData: Icons.add_circle_outline,
        text: 'Добавить работу',
      );

  static AppListTile changePassword(BuildContext context) => AppListTile(
        onTap: () => openScreen(const ChangePasswordPage()),
        iconData: Icons.lock_person_outlined,
        text: 'Изменить пароль',
      );
}

void _logout(BuildContext context) async {
  Utils.showDialog(
    title: 'Выйти из аккаунта',
    content: 'Вы уверены, что хотите выйти из аккаунта?',
    onAccept: () async => await Utils.showLoading(Get.find<AuthService>().logout()),
  );
}
