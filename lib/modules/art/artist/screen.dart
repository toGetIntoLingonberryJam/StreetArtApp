import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/data/providers/artworks_provider.dart';
import 'package:street_art_witnesses/data/providers/collection_provider.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/artworks_grid_loader.dart';
import 'package:street_art_witnesses/widgets/art/like_button.dart';
import 'package:street_art_witnesses/widgets/buttons/link_button.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: artist.name,
        action: LikeButton(collType: CollectionType.artists, id: artist.id),
      ),
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
                  ArtworksGridLoader(
                    artworksFuture: ArtworksProvider.getArtworksOfAuthor(artist.id),
                    title: artist.name,
                    showAuthor: false,
                  ),
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
      return AppContainer(child: Text(artist.name, style: NewTextStyles.title3Bold));
    }
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(artist.name, style: NewTextStyles.title3Bold),
          const SizedBox(height: 24),
          const SizedBox(height: Paddings.small),
          Text(
            artist.description!,
            style: NewTextStyles.bodyRegular,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Paddings.small),
          LinkButton('Подробнее', onTap: () => openScreen(_DescriptionPage(artist))),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LoadingImageCircleAvatar(imageUrl: artist.image?.imageUrl),
                      const SizedBox(width: Paddings.small),
                      Text(artist.name, style: NewTextStyles.title3Bold),
                    ],
                  ),
                  const SizedBox(height: Paddings.small),
                  Text(artist.description!, style: NewTextStyles.bodyRegular),
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
