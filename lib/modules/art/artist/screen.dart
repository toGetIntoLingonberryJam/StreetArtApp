import 'package:flutter/material.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/modules/art/artist/widgets/artist_info.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/app_image_slider.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImageSlider(images: artist.image == null ? null : [artist.image!]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ArtistInfoCard(artistName: artist.name),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
