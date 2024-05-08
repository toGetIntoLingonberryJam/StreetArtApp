import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/providers/collection_provider.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/address_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/artwork_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/description_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/festival_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/like_button.dart';
import 'package:street_art_witnesses/widgets/buttons/link_button.dart';

class ArtworkScreen extends StatelessWidget {
  const ArtworkScreen({super.key, required this.artwork}) : preview = false;
  const ArtworkScreen.preview({super.key, required this.artwork}) : preview = true;

  final Artwork artwork;
  final bool preview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: artwork.title,
        autoImplyLeading: !preview,
        action: IgnorePointer(
          ignoring: preview,
          child: LikeButton(collType: CollectionType.artworks, id: artwork.id),
        ),
      ),
      body: SingleChildScrollView(
        child: IgnorePointer(
          ignoring: preview,
          child: Column(
            children: [
              AppImageSlider(images: artwork.images),
              Padding(
                padding: kDensePagePadding,
                child: Column(
                  children: [
                    const SizedBox(height: Paddings.small),
                    ArtworkInfo(artwork: artwork),
                    const SizedBox(height: Paddings.small),
                    FestivalInfoWidget(artwork.festivalPreview),
                    if (artwork.festivalPreview != null) const SizedBox(height: Paddings.small),
                    AddressInfo(artwork: artwork, preview: preview),
                    const SizedBox(height: Paddings.small),
                    ArtworkDescriptionWidget(artwork),
                    if (artwork.description != null && artwork.description!.isNotEmpty) const SizedBox(height: Paddings.small),
                    LinksInfo(artwork.links),
                    if (artwork.links != null) const SizedBox(height: Paddings.small),
                    AppContainer(
                      child: Text('Добавлено: ID ${artwork.addedByUserId}', style: NewTextStyles.bodyRegular),
                    ),
                    const SizedBox(height: Paddings.small),
                    const WriteUsWidget(),
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

class WriteUsWidget extends StatelessWidget {
  const WriteUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Есть неточности?',
            style: NewTextStyles.bodyRegular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: Paddings.small),
          LinkButton('Напишите', onTap: () => Utils.tryLaunchUrl(reportLink)),
        ],
      ),
    );
  }
}
