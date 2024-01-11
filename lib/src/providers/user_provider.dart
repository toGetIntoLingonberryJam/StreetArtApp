import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/author/author.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';
import 'package:street_art_witnesses/src/utils/logger.dart';

class UserProvider with ChangeNotifier {
  UserProvider({required User user}) {
    setUser(user);
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

  User _user = User.guest();
  List<Author>? _likedAuthors;
  List<Artwork>? _likedArtworks;

  User get user => _user;
  List<Author>? get likedAuthors => _likedAuthors;
  List<Artwork>? get likedArtworks => _likedArtworks;

  void setUser(User user) {
    Logger.message('[NEW USER] ${user.username}');
    _user = user;
    _likedArtworks = null;
    _likedAuthors = null;
    syncUserData();

    notifyListeners();
  }

  Future<void> syncUserData() async {
    final authorsFuture = ArtworkService.gatAuthors();
    final artworksFuture = ArtworkService.getArtworks();

    final result = await Future.wait([
      authorsFuture,
      artworksFuture,
    ]);

    _likedAuthors = result[0] as List<Author>;
    _likedArtworks = result[1] as List<Artwork>;
    notifyListeners();
  }

  // TODO: Clear all user data: favourites, search history, tours, everyhting that depends on user
  Future<void> logout() async {
    Logger.message('[USER LOGGED OUT]');
    await UserService.deleteUserData();
    EmailCounterProvider.reset();
    setUser(User.guest());
  }
}
