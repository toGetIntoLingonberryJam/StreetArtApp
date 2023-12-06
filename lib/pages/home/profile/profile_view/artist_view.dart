import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/home/profile/widgets/role_tile.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/pages/home/profile/widgets/profile_tile.dart';
import 'package:street_art_witnesses/widgets/containers/user_tiles.dart';

class ArtistView extends StatelessWidget {
  const ArtistView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>().user;

    return SingleChildScrollView(
      padding: kPagePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileTile(username: user.username, email: user.email!),
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
