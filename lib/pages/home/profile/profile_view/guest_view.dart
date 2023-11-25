import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/auth/auth_page.dart';
import 'package:street_art_witnesses/src/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/src/widgets/containers/app_list_tile.dart';

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
          Text(
            'Войдите в профиль',
            style: TextStyles.titles.w500,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Чтобы пользоваться всеми функциями приложения',
            style: TextStyles.headlines.w400,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          AppButton.primary(
            onTap: login,
            child: Text('Войти', style: TextStyles.headlines.w400),
          ),
        ],
      ),
    );
  }
}
