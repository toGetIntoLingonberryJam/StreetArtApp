import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/artist.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ArtistsView extends StatelessWidget {
  const ArtistsView({
    super.key,
    required this.artists,
  });

  final List<ArtistCardModel>? artists;

  @override
  Widget build(BuildContext context) {
    if (artists == null) {
      return const Center(child: AppLoadingIndicator());
    }
    if (artists!.isEmpty) {
      return const Center(
          child: Text(
        'У вас нет сохраненных авторов',
        style: TextStyles.headline2,
      ));
    }

    return ListView.separated(
      itemCount: artists!.length,
      itemBuilder: (_, index) => ArtistCard(artist: artists![index]),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
    );
  }
}

class ArtistCard extends StatelessWidget {
  const ArtistCard({super.key, required this.artist});

  final ArtistCardModel artist;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AppPlaceholder.assetImage(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.centerLeft,
              child: Text(artist.name, style: TextStyles.headline1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
