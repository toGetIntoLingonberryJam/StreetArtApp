import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/values/constants.dart';

class ToursPage extends StatelessWidget {
  const ToursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SAScaffold(
      title: 'Экскурсии',
      paddings: kPagePadding,
      body: Center(child: Text('Экскурсии', style: SATextStyles.headline1)),
    );
  }
}
