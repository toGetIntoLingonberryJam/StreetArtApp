import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/author/author.dart';
import 'package:street_art_witnesses/src/services/api_service.dart';

class FavouritesProvider extends ChangeNotifier {
  FavouritesProvider() {
    updateFromApi();
  }

  Future<void> updateFromApi() async {
    final authorsFuture = ApiService.getAuthors();
    final artworksFuture = ApiService.getArtworks();

    final result = await Future.wait([
      authorsFuture,
      artworksFuture,
    ]);

    _authors = result[0] as List<Author>;
    _artworks = result[1] as List<Artwork>;
    notifyListeners();
  }

  List<Author>? _authors;
  List<Artwork>? _artworks;

  List<Author>? get authors => _authors;
  List<Artwork>? get artworks => _artworks;
}
