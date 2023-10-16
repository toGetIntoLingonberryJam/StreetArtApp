import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/user/guest_user.dart';
import 'package:street_art_witnesses/src/models/user/user.dart';
import 'package:street_art_witnesses/src/services/storage_service.dart';

class UserProvider extends ChangeNotifier {
  UserProvider({required User user}) {
    _user = user;
  }

  late User _user;

  User get user => _user;

  void updateUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> logout() async {
    _user = GuestUser();
    await StorageService.deleteUserInfo();
    notifyListeners();
  }
}
