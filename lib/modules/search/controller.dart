import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/providers/artists_provider.dart';

class AppSearchController extends GetxController {
  final searchController = TextEditingController();
  bool isLoading = true;
  List<ArtistPreview> _artists = [];
  List<ArtistPreview> get items => filterItems().toList();

  Iterable<ArtistPreview> filterItems() => _artists
      .where((a) => a.name.toLowerCase().contains(searchController.text.toLowerCase().trim()));

  void loadArtists() async {
    _artists = await ArtistsProvider.getArtists() ?? [];
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    loadArtists();
    searchController.addListener(update);
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
