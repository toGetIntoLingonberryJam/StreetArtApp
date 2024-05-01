import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';
import 'package:street_art_witnesses/data/providers/collection_provider.dart';

class CollectionController extends GetxController {
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

  bool isLiked(CollectionType collType, int id) {
    if (collType == CollectionType.artworks) return artworks.containsKey(id);
    return false;
  }
}
