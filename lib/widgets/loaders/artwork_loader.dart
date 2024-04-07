import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/values/constants.dart';

class ArtworkLoader extends StatelessWidget {
  const ArtworkLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      title: '',
      body: ListView(
        padding: kDensePagePadding,
        children: const [
          SASkeleton(height: 400),
          SizedBox(height: Paddings.small),
          SASkeleton(height: 96),
          SizedBox(height: Paddings.small),
          SASkeleton(height: 50, borderRadius: kContainerRadius),
          SizedBox(height: Paddings.small),
          SASkeleton(height: 70),
          SizedBox(height: Paddings.small),
          SASkeleton(height: 300),
        ],
      ),
    );
  }
}
