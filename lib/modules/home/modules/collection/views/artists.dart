import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';

class ArtistsView extends StatelessWidget {
  const ArtistsView({super.key, required this.artists});

  final List<ArtistPreview>? artists;

  @override
  Widget build(BuildContext context) {
    if (artists == null) {
      return const Center(child: SALoadingIndicator());
    }
    if (artists!.isEmpty) {
      return const Center(
          child: Text(
        'У вас нет сохраненных авторов',
        style: SATextStyles.headline2,
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

  final ArtistPreview artist;

  @override
  Widget build(BuildContext context) {
    return SAContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: SAPlaceholder.assetImage(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.centerLeft,
              child: Text(artist.name, style: SATextStyles.headline1),
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
