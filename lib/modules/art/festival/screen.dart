import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/festival/festival.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_header.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/app_image_slider.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class FestivalScreen extends StatelessWidget {
  const FestivalScreen({super.key, required this.festival});

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: festival.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppImageSlider(images: festival.image == null ? null : [festival.image!]),
            Padding(
              padding: kDensePagePadding,
              child: Column(
                children: [
                  const SizedBox(height: Paddings.small),
                  _Description(festival),
                  if (festival.links != null) const SizedBox(height: Paddings.small),
                  if (festival.links != null) LinksInfo(festival.links, title: 'Ссылки'),
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
  const _Description(this.fest);

  final Festival fest;

  @override
  Widget build(BuildContext context) {
    if (fest.description == null || fest.description!.isEmpty) {
      return AppContainer(child: Text(fest.name, style: TextStyles.headline1));
    }
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fest.name, style: TextStyles.headline1),
          const SizedBox(height: 24),
          const SizedBox(height: Paddings.small),
          Text(
            fest.description!,
            style: TextStyles.text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Paddings.small),
          GestureDetector(
            onTap: () => Get.to(() => _DescriptionPage(fest)),
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
  const _DescriptionPage(this.fest);

  final Festival fest;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppCircleAvatar(radius: 16, image: AppPlaceholder.assetImage()),
                      const SizedBox(width: Paddings.small),
                      Text(fest.name, style: TextStyles.headline1),
                    ],
                  ),
                  const SizedBox(height: Paddings.small),
                  Text(fest.description!, style: TextStyles.text),
                ],
              ),
            ),
            if (fest.links != null) const SizedBox(height: Paddings.small),
            if (fest.links != null) LinksInfo(fest.links, title: 'Ссылки'),
          ],
        ),
      ),
    );
  }
}
