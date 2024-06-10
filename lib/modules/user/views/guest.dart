import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/auth/screen.dart';
import 'package:street_art_witnesses/modules/user/widgets/widgets.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class GuestView extends StatelessWidget {
  const GuestView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPagePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LoginContainer(login: () => openScreen(const AuthScreen())),
          const SizedBox(height: 24),
          UserTiles.settings(context),
          const SizedBox(height: Paddings.small),
          UserTiles.about(context),
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
        color: UIColors.backgroundCard,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Войдите в профиль',
            style: NewTextStyles.title3Regular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Paddings.small),
          const Text(
            'Чтобы пользоваться всеми функциями приложения',
            style: NewTextStyles.bodyRegular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Paddings.normal),
          AppButton.primary(onTap: login, label: 'Войти'),
        ],
      ),
    );
  }
}
