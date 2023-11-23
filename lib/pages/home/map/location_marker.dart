import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class LocationMarker extends StatelessWidget {
  const LocationMarker({super.key, required this.location});

  final ArtworkLocation location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.showSnackBar(
          'Artwork at: ${location.latitude}, ${location.longitude}'),
      child: CircleAvatar(
        foregroundImage: location.previewUrl == null
            ? null
            : NetworkImage(location.previewUrl!),
      ),
    );
  }
}
