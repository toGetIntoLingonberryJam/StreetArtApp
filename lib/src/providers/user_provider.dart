import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/author/author.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/src/services/storage_service.dart';
import 'package:street_art_witnesses/src/utils/custom_logger.dart';

class UserProvider with ChangeNotifier {
  UserProvider({required User user}) {
    setUser(user);
  }

  User _user = User.guest();
  List<Author>? _likedAuthors;
  List<Artwork>? _likedArtworks;

  User get user => _user;
  List<Author>? get likedAuthors => _likedAuthors;
  List<Artwork>? get likedArtworks => _likedArtworks;

  void setUser(User user) {
    CustomLogger.showMessage('[NEW USER] ${user.username}');
    _user = user;
    _likedArtworks = null;
    _likedAuthors = null;
    syncUserData();

    notifyListeners();
  }

  Future<void> syncUserData() async {
    final authorsFuture = ArtworkService.authors();
    final artworksFuture = ArtworkService.artworks();

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
    CustomLogger.showMessage('[USER LOGGED OUT]');
    await StorageService.deleteUserInfo();
    setUser(User.guest());
  }
}
