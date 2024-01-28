import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/auth/check_email/check_email_page.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/modules/user/widgets/profile_tile.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/modules/user/widgets/profile_list_tiles.dart';

class AuthorizedView extends StatelessWidget {
  const AuthorizedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPagePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetX<UserController>(
              builder: (c) => ProfileTile(
                    username: c.user.value.username,
                    email: c.user.value.email!,
                  )),
          const SizedBox(height: 24),
          const _LoginWarningTile(),
          const SizedBox(height: 24),
          UserTiles.settings(context),
          const SizedBox(height: 8),
          UserTiles.about(context),
          const SizedBox(height: 8),
          UserTiles.logout(context),
        ],
      ),
    );
  }
}

class _LoginWarningTile extends GetView<UserController> {
  const _LoginWarningTile();

  Future<void> _sendEmail(BuildContext context) async {
    await Utils.of(context).showLoading(
      context.read<EmailCounterProvider>().sendEmail(context, controller.user.value.email!),
    );
    Get.to(() => const CheckEmailPage());
  }

  void _updateUser(BuildContext context) async =>
      await Utils.of(context).showLoading(controller.updateUser());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
          Consumer<EmailCounterProvider>(
            builder: (context, _, __) {
              if (EmailCounterProvider.showUpdateButton) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppButton.primary(
                    onTap: () => _updateUser(context),
                    label: 'Обновить',
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
