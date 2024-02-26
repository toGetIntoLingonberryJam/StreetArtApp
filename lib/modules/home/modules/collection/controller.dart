import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artworks.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artists.dart';

enum Collection { artworks, artists }

class CollectionController extends GetxController {
  Collection _coll = Collection.artworks;
  Collection get coll => _coll;

  Widget get view {
    switch (_coll) {
      case Collection.artworks:
        return const ArtworksView(artworks: []);
      case Collection.artists:
        return const ArtistsView(artists: []);
    }
  }

  void switchPage(Collection coll) {
    _coll = coll;
    update();
  }
}
