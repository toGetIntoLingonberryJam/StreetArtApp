import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/user.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/modules/user/widgets/profile_list_tiles.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'Профиль'),
      body: Padding(
        padding: kPagePadding,
        child: GetBuilder<ProfileController>(
          builder: (ctrl) {
            return Column(
              children: [
                AppCircleAvatar(radius: 50, image: AppPlaceholder.assetImage()),
                const SizedBox(height: 20),
                _UserInfo(ctrl.user),
                const SizedBox(height: 40),
                UserTiles.changePassword(context),
                const SizedBox(height: 40),
                AppButton.primary(
                  onTap: () => Utils.showInfo('Изменения сохранены'),
                  label: 'Сохранить',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Личные данные', style: TextStyles.headline1),
        const SizedBox(height: 10),
        AppContainer(child: Text(user.username, style: TextStyles.text)),
        if (user.email != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AppContainer(
              child: Text(user.email!, style: TextStyles.text),
            ),
          ),
      ],
    );
  }
}
