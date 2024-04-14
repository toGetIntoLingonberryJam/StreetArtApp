import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/modules/art/artist/widgets/artist_info.dart';
import 'package:street_art_witnesses/widgets/other/app_header.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/app_image_slider.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: artist.name),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: Paddings.small),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImageSlider(images: artist.image == null ? null : [artist.image!]),
            const SizedBox(height: Paddings.small),
            ArtistInfoCard(artistName: artist.name),
          ],
        ),
      ),
    );
  }
}
