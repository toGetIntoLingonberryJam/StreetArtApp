import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_link.dart';

class LinksInfo extends StatelessWidget {
  const LinksInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Make a UrlParser
    final url = Uri.parse('https://google.com/');

    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Интересные ссылки', style: TextStyles.headline1),
          const SizedBox(height: 8),
          AppLink(url: url, name: 'Ссылка'),
          const SizedBox(height: 4),
          AppLink(url: url, name: 'Ссылка'),
          const SizedBox(height: 4),
          AppLink(url: url, name: 'Ссылка'),
          const SizedBox(height: 4),
          AppLink(url: url, name: 'Ссылка'),
        ],
      ),
    );
  }
}
