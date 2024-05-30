import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class LinksInfo extends StatelessWidget {
  const LinksInfo(this.links, {super.key, this.title});

  final List<String>? links;
  final String? title;

  @override
  Widget build(BuildContext context) {
    if (links == null) return const SizedBox();

    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? 'Интересные ссылки', style: NewTextStyles.title3Bold),
          const SizedBox(height: Paddings.small),
          for (int idx = 0; idx < links!.length; idx++)
            Padding(
              padding: EdgeInsets.only(bottom: idx == links!.length - 1 ? 0 : 4),
              child: AppLink(url: Uri.parse(links![idx]), name: links![idx]),
            ),
        ],
      ),
    );
  }
}
