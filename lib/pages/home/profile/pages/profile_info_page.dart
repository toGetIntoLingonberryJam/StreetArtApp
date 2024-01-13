import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/home/profile/widgets/profile_list_tiles.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              const AppAppbar(title: 'Профиль'),
              const SizedBox(height: 20),
              AppCircleAvatar(radius: 50, image: AppPlaceholder.assetImage()),
              const SizedBox(height: 20),
              const _UserInfo(),
              const SizedBox(height: 40),
              UserTiles.changePassword(context),
              const SizedBox(height: 40),
              AppButton.primary(
                onTap: () => Utils.of(context).showMessage('Изменения сохранены'),
                label: 'Сохранить',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo();

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Личные данные', style: TextStyles.headline1),
        const SizedBox(height: 10),
        AppContainer.small(child: Text(user.username, style: TextStyles.text)),
        if (user.email != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AppContainer.small(
              child: Text(user.email!, style: TextStyles.text),
            ),
          ),
      ],
    );
  }
}
