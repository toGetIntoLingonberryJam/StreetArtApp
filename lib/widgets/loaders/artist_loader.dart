import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/values/constants.dart';

class ArtistLoader extends StatelessWidget {
  const ArtistLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      title: '',
      paddings: kDensePagePadding,
      body: ListView(
        children: const [
          SASkeleton(height: 400),
          SizedBox(height: Paddings.small),
          SASkeleton(height: 46),
        ],
      ),
    );
  }
}
