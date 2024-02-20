import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location.dart';

abstract class ArtworksProvider {
  Future<List<ArtworkLocation>?> getArtworkLocations();
  Future<Artwork?> getArtworkById(int id);
}
