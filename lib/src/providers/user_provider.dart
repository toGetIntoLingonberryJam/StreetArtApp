import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/user.dart';
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

  // TODO: Clear all user data: favourites, search history, tours, everyhting that depends on user
  Future<void> logout() async {
    _user = User.guest();
    await StorageService.deleteUserInfo();
    notifyListeners();
  }
}
