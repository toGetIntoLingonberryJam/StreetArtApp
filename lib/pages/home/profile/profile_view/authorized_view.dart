import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/auth/check_email/check_email_page.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/pages/home/profile/widgets/profile_tile.dart';
import 'package:street_art_witnesses/widgets/containers/app_list_tile.dart';

class AuthorizedView extends StatelessWidget {
  const AuthorizedView({super.key});

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

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>().user;

    return SingleChildScrollView(
      padding: kPagePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileTile(
            username: user.username,
            email: user.email!,
          ),
          const SizedBox(height: 24),
          const _LoginWarningTile(),
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
          const SizedBox(height: 8),
          AppListTile(
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

class _LoginWarningTile extends StatelessWidget {
  const _LoginWarningTile();

  void _sendEmail(BuildContext context) {
    final user = context.read<UserProvider>().user;
    final counter = context.read<EmailCounterProvider>();

    // When opening for the first time, send email instantly
    if (EmailCounterProvider.firstOpened) {
      counter.sendEmail(context, user.email!);
      EmailCounterProvider.firstOpened = false;
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CheckEmailPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Чтобы пользоваться всеми функциями приложения, подтвердите почту.',
                  style: TextStyles.text,
                ),
                GestureDetector(
                  onTap: () => _sendEmail(context),
                  child: Text(
                    'Отправить письмо',
                    style: TextStyles.text.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
