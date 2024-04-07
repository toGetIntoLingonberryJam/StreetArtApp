import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/applications/screen.dart';
import 'package:street_art_witnesses/modules/moderation/screens/warning.dart';
import 'package:street_art_witnesses/modules/user/modules/about.dart';
import 'package:street_art_witnesses/modules/user/modules/change_password.dart';
import 'package:street_art_witnesses/modules/user/modules/settings/screen.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';

abstract class UserTiles {
  static SAListTile settings(BuildContext context) => SAListTile(
        onTap: () => Get.to(() => const SettingsScreen()),
        iconData: Icons.settings_outlined,
        text: 'Настройки',
      );

  static SAListTile about(BuildContext context) => SAListTile(
        onTap: () => Get.to(() => const AboutPage()),
        iconData: Icons.info_outline,
        text: 'О нас',
      );

  static SAListTile logout(BuildContext context) => SAListTile(
        onTap: () => _logout(context),
        iconData: Icons.logout,
        text: 'Выйти',
        foregroundColor: Theme.of(context).colorScheme.error,
      );

  static SAListTile publications(BuildContext context) => const SAListTile(
        iconData: Icons.collections_outlined,
        text: 'Мои публикации',
        notificationsCount: 1,
      );

  static SAListTile applications(BuildContext context) => SAListTile(
        onTap: () => Get.to(() => const ApplicationsScreen()),
        iconData: Icons.filter_list,
        text: 'Заявки на публикацию',
        notificationsCount: 100,
      );

  static SAListTile addArtwork(BuildContext context) => SAListTile(
        onTap: () => Get.to(() => const ModerationWarningScreen()),
        iconData: Icons.add_circle_outline,
        text: 'Добавить работу',
      );

  static SAListTile changePassword(BuildContext context) => SAListTile(
        onTap: () => Get.to(() => const ChangePasswordPage()),
        iconData: Icons.lock_person_outlined,
        text: 'Изменить пароль',
      );
}

void _logout(BuildContext context) async {
  final isLogout = await Utils.showDialog(
        title: 'Выйти из аккаунта',
        content: 'Вы уверены, что хотите выйти из аккаунта?',
      ) ??
      false;

  if (context.mounted && isLogout) {
    await Utils.showLoading(Get.find<AuthService>().logout());
  }
}
