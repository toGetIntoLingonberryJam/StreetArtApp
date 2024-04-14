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

class ArtworkScreen extends StatelessWidget {
  const ArtworkScreen({super.key, required this.artwork}) : preview = false;
  const ArtworkScreen.preview({super.key, required this.artwork}) : preview = true;

  final Artwork artwork;
  final bool preview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: artwork.title, autoImplyLeading: !preview),
      body: SingleChildScrollView(
        padding: kDensePagePadding,
        child: IgnorePointer(
          ignoring: preview,
          child: Column(
            children: [
              AppImageSlider(images: artwork.images),
              const SizedBox(height: Paddings.small),
              ArtworkInfo(artwork: artwork),
              const SizedBox(height: Paddings.small),
              FestivalInfoWidget(artwork.festivalPreview),
              if (artwork.festivalPreview != null) const SizedBox(height: Paddings.small),
              AddressInfo(artwork: artwork, preview: preview),
              const SizedBox(height: Paddings.small),
              ArtworkDescriptionWidget(artwork.description),
              StatusInfo(artwork.status),
              const SizedBox(height: Paddings.small),
              LinksInfo(artwork.links),
              if (artwork.links != null) const SizedBox(height: Paddings.small),
              const _WriteUsWidget(),
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
    return AppContainer(
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
