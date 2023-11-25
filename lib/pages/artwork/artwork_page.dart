import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/address_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/description_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/festival_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/artwork_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/pages/artwork/widgets/state_info.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_image.dart';
import 'package:street_art_witnesses/src/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/src/widgets/buttons/app_icon_button.dart';
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
              _ArtworkImageSlider(images: artwork.images),
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

class _ArtworkImageSlider extends StatefulWidget {
  const _ArtworkImageSlider({required this.images});

  final List<ArtworkImage>? images;

  @override
  State<_ArtworkImageSlider> createState() => _ArtworkImageSliderState();
}

class _ArtworkImageSliderState extends State<_ArtworkImageSlider> {
  @override
  Widget build(BuildContext context) {
    if (widget.images == null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: AppContainer.small(
          child: Text(
            'Фотографии отсутствуют',
            style: TextStyles.titles.w500,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    final images = widget.images!;

    return Stack(
      children: [
        ImageSlider(images: images),
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                AppIconButton(
                  onTap: () => Navigator.of(context).pop(),
                  iconData: Icons.arrow_back,
                ),
                const Expanded(child: SizedBox()),
                AppIconButton(onTap: () {}, iconData: Icons.edit_outlined),
                const SizedBox(width: 10),
                AppIconButton(onTap: () {}, iconData: Icons.favorite_border),
              ],
            )),
      ],
    );
  }
}