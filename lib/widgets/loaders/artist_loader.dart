import 'package:street_art_ui_kit/street_art_ui_kit.dart';

class ArtistLoader extends StatelessWidget {
  const ArtistLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAHeader(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            SASkeleton(height: 380),
            SizedBox(height: 10),
            SASkeleton(height: 100),
          ],
        ),
      ),
    );
  }
}
