import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/data/providers/artworks/provider.dart';

class EmptyArtworksProvider implements ArtworksProvider {
  @override
  Future<Artwork?> getArtworkById(int id) async => null;

  @override
  Future<List<ArtworkLocation>?> getArtworkLocations() async => [];
}
