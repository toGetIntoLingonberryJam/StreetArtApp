import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/festival/festival.dart';
import 'package:street_art_witnesses/data/providers/artworks_provider.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/artworks_grid_loader.dart';
import 'package:street_art_witnesses/widgets/buttons/link_button.dart';

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
                  ArtworksGridLoader(artworksFuture: ArtworksProvider.getArtworksOfFestival(festival.id)),
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
          LinkButton('Подробнее', onTap: () => Get.to(() => _DescriptionPage(fest)))
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
                      LoadingImageCircleAvatar(imageUrl: fest.image?.imageUrl),
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
