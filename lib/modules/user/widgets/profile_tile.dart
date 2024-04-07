import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/user/modules/user_info.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.username,
    required this.email,
  });

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kContainerRadius),
      onTap: () => Get.to(() => const UserInfoScreen()),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundImage: SAPlaceholder.assetImage(),
              radius: 36,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: SATextStyles.headline1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    email,
                    style: SATextStyles.text.copyWith(color: context.colors.secondaryContainer),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
