import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/models/user.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/user/views/views.dart';

class ProfileController extends GetxController {
  final _userService = Get.find<AuthService>();

  @override
  void onInit() {
    ever(_userService.user, (callback) => update());
    super.onInit();
  }

  User get user => _userService.user.value;

  Future<void> updateUser() => _userService.updateUser();

  Widget get view {
    if (user.isModerator) return const ModeratorView();
    if (user.isArtist) return const ArtistView();
    if (user.isVerified) return const VerifiedView();
    if (user.isAuthorized) return const AuthorizedView();
    return const GuestView();
  }
}
