import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class LocationMarker extends StatelessWidget {
  const LocationMarker({super.key, required this.artwork});

  final ArtworkLocation artwork;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.showSnackBar(
          'Artwork at: ${artwork.latitude}, ${artwork.longitude}'),
      child: CircleAvatar(
        foregroundImage: artwork.previewUrl == null
            ? null
            : NetworkImage(artwork.previewUrl!),
      ),
    );
  }
}
