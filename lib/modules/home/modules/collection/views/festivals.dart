import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';

class FestivalsView extends StatelessWidget {
  const FestivalsView({super.key, required this.festsPrevs});

  final List<FestivalPreview>? festsPrevs;

  @override
  Widget build(BuildContext context) {
    if (festsPrevs == null) {
      return const Center(child: SALoadingIndicator());
    }
    if (festsPrevs!.isEmpty) {
      return const Center(
          child: Text(
        'У вас нет сохраненных фестивалей',
        style: SATextStyles.headline2,
      ));
    }

    return ListView.separated(
      itemCount: festsPrevs!.length,
      itemBuilder: (_, index) => FestCard(festsPrevs![index]),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
    );
  }
}

class FestCard extends StatelessWidget {
  const FestCard(this.preview, {super.key});

  final FestivalPreview preview;

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
              child: Text(preview.name, style: SATextStyles.headline1),
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
