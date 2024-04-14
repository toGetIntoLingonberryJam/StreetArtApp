import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
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
        child: Column(
          children: [
            AppImageSlider(images: artist.image == null ? null : [artist.image!]),
            Padding(
              padding: kDensePagePadding,
              child: Column(
                children: [
                  const SizedBox(height: Paddings.small),
                  AppContainer(child: Text(artist.name, style: TextStyles.headline1))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
