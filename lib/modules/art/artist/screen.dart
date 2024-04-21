import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/data/providers/artworks_provider.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/artwork_preview_widget.dart';
import 'package:street_art_witnesses/widgets/buttons/link_button.dart';
import 'package:street_art_witnesses/widgets/containers/grid_column.dart';

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
                  _ArtworksLoader(artist.id),
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
          LinkButton('Подробнее', onTap: () => Get.to(() => _DescriptionPage(artist))),
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

class _ArtworksLoader extends StatelessWidget {
  const _ArtworksLoader(this.artistId);

  final int artistId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppContainer(
          color: UIColors.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Работы', style: TextStyles.headline1),
              LinkButton('Показать все'),
            ],
          ),
        ),
        const SizedBox(height: Paddings.small),
        FutureBuilder(
          future: ArtworksProvider.getArtworksOfAuthor(artistId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AppLoadingIndicator();
            } else if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    'У этого автора нет работ',
                    style: TextStyles.headline1,
                  ),
                );
              } else {
                return GridColumn(
                  widgetHeight: 240,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final preview = snapshot.data![index];
                    return SmallArtworkPreviewWidget(preview);
                  },
                );
              }
            }
            return const AppErrorWidget();
          },
        ),
      ],
    );
  }
}
