import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

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
      onTap: () => Utils.showMessage(context, 'Профиль'),
      child: Ink(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundImage: AppPlaceholder.assetImage(),
              radius: 36,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyles.headline1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    email,
                    style: TextStyles.text,
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
