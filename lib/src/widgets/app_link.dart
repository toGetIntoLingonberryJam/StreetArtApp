import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLink extends StatelessWidget {
  const AppLink({
    super.key,
    required this.url,
    required this.name,
  });

  final Uri url;
  final String name;

  void _launchUrl(BuildContext context, Uri url) async {
    final success = await Utils.showLoading(context, launchUrl(url));

    if (!success) {
      Utils.showDebugMessage('Could not launch $url');
    }
  }

  void _askToFollowLink(BuildContext context, Uri url) async {
    final response = await Utils.showWarning(
      context,
      title: 'Переход по ссылке',
      content: 'Вы собираетесь перейти на сайт: $url',
      acceptText: 'Перейти',
      declineText: 'Отмена',
    );

    if (response != null && response == true && context.mounted) {
      _launchUrl(context, url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _askToFollowLink(context, url),
      child: Row(
        children: [
          const Icon(Icons.link),
          const SizedBox(width: 8),
          Text(name, style: TextStyles.headlines.w400),
        ],
      ),
    );
  }
}
