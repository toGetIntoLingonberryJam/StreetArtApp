import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/modules/user/views/artist.dart';
import 'package:street_art_witnesses/modules/user/views/authorized.dart';
import 'package:street_art_witnesses/modules/user/views/guest.dart';
import 'package:street_art_witnesses/modules/user/views/moderator.dart';
import 'package:street_art_witnesses/modules/user/views/verified.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';

class UserController extends GetxController {
  UserController({required User user}) : _user = user.obs;

  final Rx<User> _user;
  Rx<User> get user => _user;

  Widget get view {
    if (user.value.isModerator) return const ModeratorView();
    if (user.value.isArtist) return const ArtistView();
    if (user.value.isVerified) return const VerifiedView();
    if (user.value.isAuthorized) return const AuthorizedView();
    return const GuestView();
  }

  static Future<User> getCurrentUser() async {
    // Retrieve token from localstore, if exists
    final token = await LocalStoreService.retrieveToken();

    if (token != null) {
      final user = await UserService.getUserViaToken(token: token);
      return user;
    }

    return User.guest();
  }

  Future<void> updateUser() async {
    final user = await getCurrentUser();
    setUser(user);
  }

  void setUser(User user) {
    Logger.message('[NEW USER] ${user.username}');
    _user.value = user;
  }

  // TODO: Clear all user data: favourites, search history, tours, everyhting that depends on user
  Future<void> logout() async {
    Logger.message('[USER LOGGED OUT]');
    await UserService.deleteUserData();
    EmailCounterProvider.reset();
    setUser(User.guest());
  }
}
