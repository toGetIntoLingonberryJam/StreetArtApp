import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/models/user.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/modules/user/widgets/profile_list_tiles.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      title: 'Профиль',
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: GetBuilder<ProfileController>(
          builder: (ctrl) {
            return Column(
              children: [
                SACircleAvatar(radius: 50, image: SAPlaceholder.assetImage()),
                const SizedBox(height: 20),
                _UserInfo(ctrl.user),
                const SizedBox(height: 40),
                UserTiles.changePassword(context),
                const SizedBox(height: 40),
                SAPrimaryButton(
                  onTap: () => Utils.showSuccess('Изменения сохранены'),
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
        const Text('Личные данные', style: SATextStyles.headline1),
        const SizedBox(height: 10),
        SAContainer.small(child: Text(user.username, style: SATextStyles.text)),
        if (user.email != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SAContainer.small(
              child: Text(user.email!, style: SATextStyles.text),
            ),
          ),
      ],
    );
  }
}
