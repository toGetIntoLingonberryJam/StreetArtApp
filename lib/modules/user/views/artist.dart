import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/modules/user/widgets/role_tile.dart';
import 'package:street_art_witnesses/modules/user/widgets/profile_tile.dart';
import 'package:street_art_witnesses/modules/user/widgets/profile_list_tiles.dart';

class ArtistView extends StatelessWidget {
  const ArtistView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPagePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<UserController>(
              builder: (c) => ProfileTile(
                    username: c.user.value.username,
                    email: c.user.value.email!,
                  )),
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
