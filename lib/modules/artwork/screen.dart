import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/image.dart';
import 'package:street_art_witnesses/modules/artwork/widgets/address_info.dart';
import 'package:street_art_witnesses/modules/artwork/widgets/description_info.dart';
import 'package:street_art_witnesses/modules/artwork/widgets/festival_info.dart';
import 'package:street_art_witnesses/modules/artwork/widgets/artwork_info.dart';
import 'package:street_art_witnesses/modules/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/modules/artwork/widgets/status_info.dart';
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
                    FestivalInfoWidget(artwork.festival),
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

class _ArtworkImageSlider extends StatelessWidget {
  const _ArtworkImageSlider({required this.images});

  // final List<ArtworkImage>? images;
  final List<ImageSchema>? images;

  @override
  Widget build(BuildContext context) {
    if (images == null || images!.isEmpty) {
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

    return Stack(
      children: [
        ImageSlider(images: images!),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                AppIconButton(onTap: Get.back, iconData: Icons.arrow_back),
                const Expanded(child: SizedBox()),
                AppIconButton(
                  onTap: () => Utils.showInfo('Изменить работу'),
                  iconData: Icons.edit_outlined,
                ),
                const SizedBox(width: 10),
                AppIconButton(
                  onTap: () => Utils.showInfo('Добавить в избранное'),
                  iconData: Icons.favorite_border,
                ),
              ],
            )),
      ],
    );
  }
}
