import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location/artwork_location.dart';
import 'package:street_art_witnesses/widgets/map/location_marker/controller.dart';

class LocationMarker extends StatelessWidget {
  const LocationMarker({super.key, required this.location});

  final ArtworkLocation location;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LocationMarkerController(location), tag: '${location.artworkId}');
    return GetBuilder<LocationMarkerController>(
        init: c, tag: '${location.artworkId}', builder: (c) => c.widget);
  }
}
