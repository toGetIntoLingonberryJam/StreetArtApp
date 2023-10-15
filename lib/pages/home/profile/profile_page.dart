import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_view/authorized_view.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_view/guest_view.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<UserProvider>(
            builder: (_, provider, __) {
              if (provider.user.isVerified) {
                // TODO: Change for verified view
                return const AuthorizedView();
              }
              if (provider.user.isAuthorized) {
                return const AuthorizedView();
              }
              return const GuestView();
            },
          ),
        ),
      ),
    );
  }
}
