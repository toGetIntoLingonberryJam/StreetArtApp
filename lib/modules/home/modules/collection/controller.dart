import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/data/providers/collection_provider.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';

class CollectionController extends GetxController {
  // Artworks
  Map<int, ArtworkPreview> artworks = {};
  bool isLoadingArtworks = false;

  void loadArtworks() async {
    isLoadingArtworks = true;
    update();

    final previews = await CollectionProvider.loadArtworks();
    if (previews == null) {
      isLoadingArtworks = false;
      Utils.showError('Не удалось загрузить коллекцию');
      return update();
    }

    artworks.clear();
    for (final preview in previews) {
      artworks[preview.id] = preview;
    }
    isLoadingArtworks = false;
    update();
  }

  // Artists
  Map<int, ArtistPreview> artists = {};
  bool isLoadingArtists = false;

  void loadArtists() async {
    isLoadingArtists = true;
    update();

    final previews = await CollectionProvider.loadArtists();
    if (previews == null) {
      isLoadingArtists = false;
      Utils.showError('Не удалось загрузить коллекцию');
      return update();
    }

    artists.clear();
    for (final preview in previews) {
      artists[preview.id] = preview;
    }
    isLoadingArtists = false;
    update();
  }

  // Festivals
  Map<int, FestivalPreview> festivals = {};
  bool isLoadingFestivals = false;

  void loadFestivals() async {
    isLoadingFestivals = true;
    update();

    final previews = await CollectionProvider.loadFestivals();
    if (previews == null) {
      isLoadingFestivals = false;
      Utils.showError('Не удалось загрузить коллекцию');
      return update();
    }

    festivals.clear();
    for (final preview in previews) {
      festivals[preview.id] = preview;
    }
    isLoadingFestivals = false;
    update();
  }

  // General
  bool isLiked(CollectionType collType, int id) {
    if (collType == CollectionType.artworks) return artworks.containsKey(id);
    if (collType == CollectionType.artists) return artists.containsKey(id);
    if (collType == CollectionType.festivals) return festivals.containsKey(id);
    return false;
  }

  void loadAll() {
    if (!Get.find<AuthService>().user.value.isAuthorized) return;
    loadArtworks();
    loadArtists();
    loadFestivals();
  }

  void clearAll() {
    artworks.clear();
    artists.clear();
    festivals.clear();
    update();
  }
}
