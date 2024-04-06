import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artworks.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artists.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/festivals.dart';

enum Collection { artworks, artists, festivals }

class CollectionController extends GetxController {
  Collection _coll = Collection.artworks;
  Collection get coll => _coll;

  Widget get view => switch (_coll) {
        Collection.artworks => const ArtworksView(artworks: []),
        Collection.artists => const ArtistsView(artists: []),
        Collection.festivals => const FestivalsView(festivals: []),
      };

  void switchPage(Collection coll) {
    _coll = coll;
    update();
  }
}
