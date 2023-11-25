import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/widgets/app_container.dart';

class LinksInfo extends StatelessWidget {
  const LinksInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Интересные ссылки', style: TextStyles.titles.w500),
          const SizedBox(height: 8),
          const _AppLink(),
          const SizedBox(height: 4),
          const _AppLink(),
          const SizedBox(height: 4),
          const _AppLink(),
          const SizedBox(height: 4),
          const _AppLink(),
        ],
      ),
    );
  }
}

class _AppLink extends StatelessWidget {
  const _AppLink();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.link),
        const SizedBox(width: 8),
        Text('Ссылка', style: TextStyles.headlines.w400)
      ],
    );
  }
}
