import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/widgets/skeletons/app_placeholder.dart';

class ArtworksView extends StatelessWidget {
  const ArtworksView({
    super.key,
    required this.artworks,
  });

  final List<Artwork>? artworks;

  Future<void> _refresh(BuildContext context) async {
    return await context.read<UserProvider>().syncUserData();
  }

  @override
  Widget build(BuildContext context) {
    if (artworks == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: ListView.separated(
        itemCount: artworks!.length,
        itemBuilder: (_, index) => ArtworkCard(artwork: artworks![index]),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
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
                        style: const TextStyle(fontSize: 14),
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
                    style: const TextStyle(fontSize: 20, height: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    artwork.location.address,
                    style: const TextStyle(fontSize: 12),
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
