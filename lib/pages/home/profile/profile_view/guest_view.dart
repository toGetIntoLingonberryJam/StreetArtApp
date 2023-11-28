import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/auth/auth_page.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_list_tile.dart';

class GuestView extends StatelessWidget {
  const GuestView({super.key});

  void _login(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const AuthPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPagePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LoginContainer(login: () => _login(context)),
          const SizedBox(height: 24),
          const AppListTile(
            iconData: Icons.settings_outlined,
            text: 'Настройки',
          ),
          const SizedBox(height: 8),
          const AppListTile(
            iconData: Icons.info_outline,
            text: 'О нас',
          ),
        ],
      ),
    );
  }
}

class _LoginContainer extends StatelessWidget {
  const _LoginContainer({required this.login});

  final VoidCallback login;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Войдите в профиль',
            style: TextStyles.headline1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Чтобы пользоваться всеми функциями приложения',
            style: TextStyles.text,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          AppButton.primary(onTap: login, text: 'Войти'),
        ],
      ),
    );
  }
}
