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
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/buttons/app_icon_button.dart';
import 'package:street_art_witnesses/widgets/other/image_slider.dart';

class ArtworkPage extends StatelessWidget {
  const ArtworkPage({super.key, required this.artwork});

  final Artwork artwork;

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
              _ArtworkImageSlider(images: artwork.images),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ArtworkInfo(artwork: artwork),
                    const SizedBox(height: 8),
                    FestivalInfo(artwork.festivalId),
                    if (artwork.festivalId != null) const SizedBox(height: 8),
                    AddressInfo(artwork: artwork),
                    const SizedBox(height: 8),
                    DescriptionInfo(artwork.description),
                    const SizedBox(height: 8),
                    const StateInfo(),
                    const SizedBox(height: 8),
                    const LinksInfo(),
                    const SizedBox(height: 8),
                    const AppContainer.small(
                      child: Text(
                        'Добавлено: юзернейм',
                        style: TextStyles.headline2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AppContainer.small(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Есть неточности? ',
                            style: TextStyles.headline2,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Напишите',
                            style: TextStyles.headline2.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
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
      return const Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
        child: AppContainer.small(
          child: Text(
            'Фотографии отсутствуют',
            style: TextStyles.headline1,
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
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                AppIconButton(
                  onTap: () => Navigator.of(context).pop(),
                  iconData: Icons.arrow_back,
                ),
                const Expanded(child: SizedBox()),
                AppIconButton(
                  onTap: () => Utils.of(context).showMessage('Изменить работу'),
                  iconData: Icons.edit_outlined,
                ),
                const SizedBox(width: 10),
                AppIconButton(
                  onTap: () => Utils.of(context).showMessage('Добавить в избранное'),
                  iconData: Icons.favorite_border,
                ),
              ],
            )),
      ],
    );
  }
}
