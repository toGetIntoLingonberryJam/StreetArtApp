import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/models/artist.dart';
import 'package:street_art_witnesses/data/providers/artists/network_provider.dart';

class AppSearchController extends GetxController {
  final searchController = TextEditingController();
  final artistsProvider = NetworkArtistsProvider();
  bool isLoading = true;
  List<Artist> _artists = [];
  List<Artist> get items => filterItems().toList();

  Iterable<Artist> filterItems() => _artists
      .where((a) => a.name.toLowerCase().contains(searchController.text.toLowerCase().trim()));

  void loadArtists() async {
    _artists = await artistsProvider.getArtists() ?? [];
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
