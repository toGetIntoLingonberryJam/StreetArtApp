import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/address_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/description_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/festival_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/artwork_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/state_info.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/widgets/app_container.dart';
import 'package:street_art_witnesses/src/widgets/image_slider.dart';

class ArtworkPage extends StatelessWidget {
  const ArtworkPage({super.key, required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kDensePagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageSlider(length: 4),
              ArtworkInfo(artwork: artwork),
              const SizedBox(height: 8),
              FestivalInfo(artwork.festival),
              const SizedBox(height: 8),
              AddressInfo(artwork: artwork),
              const SizedBox(height: 8),
              DescriptionInfo(artwork.description),
              const SizedBox(height: 8),
              const StateInfo(),
              const SizedBox(height: 8),
              const LinksInfo(),
              const SizedBox(height: 8),
              AppContainer.small(
                child: Text(
                  'Добавлено: юзернейм',
                  style: TextStyles.headlines.w500,
                ),
              ),
              const SizedBox(height: 8),
              AppContainer.small(
                child: Text(
                  'Есть неточности? Напишите',
                  style: TextStyles.headlines.w500,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
