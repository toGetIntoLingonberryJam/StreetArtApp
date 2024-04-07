import 'package:street_art_ui_kit/street_art_ui_kit.dart';

class ArtworkLoader extends StatelessWidget {
  const ArtworkLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      title: '',
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            SASkeleton(height: 380),
            SizedBox(height: 10),
            SASkeleton(height: 100),
            SizedBox(height: 8),
            SASkeleton(height: 50, borderRadius: kContainerRadius),
            SizedBox(height: 8),
            SASkeleton(height: 70),
            SizedBox(height: 8),
            SASkeleton(height: 300),
          ],
        ),
      ),
    );
  }
}
