import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_view/artist_view.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_view/authorized_view.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_view/guest_view.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_view/moderator_view.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_view/verified_view.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<UserProvider>(
          builder: (_, provider, __) {
            if (provider.user.isModerator) {
              return const ModeratorView();
            }
            if (provider.user.isArtist) {
              return const ArtistView();
            }
            if (provider.user.isVerified) {
              return const VerifiedView();
            }
            if (provider.user.isAuthorized) {
              return const AuthorizedView();
            }
            return const GuestView();
          },
        ),
      ),
    );
  }
}
