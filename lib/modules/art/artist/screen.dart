import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_header.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/app_image_slider.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

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
                  _Description(artist),
                  if (artist.links != null) const SizedBox(height: Paddings.small),
                  if (artist.links != null) LinksInfo(artist.links, title: 'Ссылки'),
                  const SizedBox(height: Paddings.small),
                  const WriteUsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description(this.artist);

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    if (artist.description == null || artist.description!.isEmpty) {
      return AppContainer(child: Text(artist.name, style: TextStyles.headline1));
    }
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(artist.name, style: TextStyles.headline1),
          const SizedBox(height: 24),
          const SizedBox(height: Paddings.small),
          Text(
            artist.description!,
            style: TextStyles.text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Paddings.small),
          GestureDetector(
            onTap: () => Get.to(() => _DescriptionPage(artist)),
            child: Text(
              'Подробнее',
              style: TextStyles.text.copyWith(
                fontWeight: FontWeight.w500,
                color: UIColors.accent,
                decoration: TextDecoration.underline,
                decorationColor: UIColors.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  const _DescriptionPage(this.artist);

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'Описание'),
      body: SingleChildScrollView(
        padding: kDensePagePadding,
        child: Column(
          children: [
            AppContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      AppCircleAvatar(radius: 16, image: AppPlaceholder.assetImage()),
                      const SizedBox(width: Paddings.small),
                      Text(artist.name, style: TextStyles.headline1),
                    ],
                  ),
                  const SizedBox(height: Paddings.small),
                  Text(artist.description!, style: TextStyles.text),
                ],
              ),
            ),
            if (artist.links != null) const SizedBox(height: Paddings.small),
            if (artist.links != null) LinksInfo(artist.links, title: 'Ссылки'),
          ],
        ),
      ),
    );
  }
}
