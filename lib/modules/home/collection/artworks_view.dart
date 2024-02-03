import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class ArtworksView extends StatelessWidget {
  const ArtworksView({
    super.key,
    required this.artworks,
  });

  final List<Artwork>? artworks;

  @override
  Widget build(BuildContext context) {
    if (artworks == null) {
      return const Center(child: AppLoadingIndicator());
    }
    if (artworks!.isEmpty) {
      return const Center(
          child: Text(
        'У вас нет сохраненных работ',
        style: TextStyles.headline2,
      ));
    }

    return ListView.separated(
      itemCount: artworks!.length,
      itemBuilder: (_, index) => ArtworkCard(artwork: artworks![index]),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
    );
  }
}

class ArtworkCard extends StatelessWidget {
  const ArtworkCard({
    super.key,
    required this.artwork,
  });

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 100,
                height: 100,
                color: Theme.of(context).colorScheme.surface,
                child: const AppPlaceholder(),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Artist ID: ${artwork.artistId}',
                        style: TextStyles.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  Text(
                    artwork.title,
                    style: TextStyles.headline1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    artwork.location.address,
                    style: TextStyles.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
