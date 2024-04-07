import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';

class LinksInfo extends StatelessWidget {
  const LinksInfo(this.links, {super.key});

  final List<String>? links;

  @override
  Widget build(BuildContext context) {
    if (links == null) return const SizedBox();

    return SAContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Интересные ссылки', style: SATextStyles.headline1),
          const SizedBox(height: 8),
          for (int idx = 0; idx < links!.length; idx++)
            Padding(
              padding: EdgeInsets.only(bottom: idx == links!.length - 1 ? 0 : 4),
              child: SALinkWidget(
                url: Uri.parse(links![idx]),
                name: links![idx],
                onLinkTap: (u) => Utils.tryLaunchUrl(u),
              ),
            ),
        ],
      ),
    );
  }
}
