import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/modules/user/widgets/widgets.dart';

class ArtistView extends GetView<ProfileController> {
  const ArtistView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPagePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileTile(
            username: controller.user.username,
            email: controller.user.email!,
          ),
          const SizedBox(height: 24),
          const RoleTile(role: 'Аккаунт художника'),
          const SizedBox(height: 24),
          UserTiles.addArtwork(context),
          const SizedBox(height: 8),
          UserTiles.publications(context),
          const SizedBox(height: 8),
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
