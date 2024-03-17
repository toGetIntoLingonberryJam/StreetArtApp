import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/address_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/description_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/festival_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/artwork_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/status_info.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/app_image_slider.dart';

class ArtworkScreen extends StatelessWidget {
  const ArtworkScreen({super.key, required this.artwork}) : preview = false;

  const ArtworkScreen.preview({super.key, required this.artwork}) : preview = true;

  final Artwork artwork;
  final bool preview;

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
              AppImageSlider(images: artwork.images),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ArtworkInfo(artwork: artwork),
                    const SizedBox(height: 8),
                    FestivalInfoWidget(artwork.festivalPreview),
                    if (artwork.festivalId != null) const SizedBox(height: 8),
                    AddressInfo(artwork: artwork, preview: preview),
                    const SizedBox(height: 8),
                    ArtworkDescriptionWidget(artwork.description),
                    StatusInfo(artwork.status),
                    const SizedBox(height: 8),
                    LinksInfo(artwork.links),
                    if (artwork.links != null) const SizedBox(height: 8),
                    // const AppContainer.small(
                    //   child: Text('Добавлено: юзернейм', style: TextStyles.headline2),
                    // // ),
                    // const SizedBox(height: 8),
                    const _WriteUsWidget(),
                    const SizedBox(height: 40),
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

class _WriteUsWidget extends StatelessWidget {
  const _WriteUsWidget();

  @override
  Widget build(BuildContext context) {
    return AppContainer.small(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Есть неточности?',
            style: TextStyles.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () => Utils.tryLaunchUrl(reportLink),
            child: Text(
              'Напишите',
              style: TextStyles.headline2.copyWith(decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
