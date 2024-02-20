import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artworks.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/authors.dart';

enum Collection { artworks, authors }

class CollectionController extends GetxController {
  Collection _coll = Collection.artworks;
  Collection get coll => _coll;

  Widget get view {
    switch (_coll) {
      case Collection.artworks:
        return const ArtworksView(artworks: []);
      case Collection.authors:
        return const AuthorsView(authors: []);
    }
  }

  void switchPage(Collection coll) {
    _coll = coll;
    update();
  }
}
