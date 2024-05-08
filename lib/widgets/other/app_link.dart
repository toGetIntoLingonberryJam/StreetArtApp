import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class AppLink extends StatelessWidget {
  const AppLink({
    super.key,
    required this.url,
    required this.name,
  });

  final Uri url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.tryLaunchUrl(url),
      child: Row(
        children: [
          const Icon(Icons.link),
          const SizedBox(width: 8),
          Text(name, style: NewTextStyles.bodyRegular.copyWith(decoration: TextDecoration.underline)),
        ],
      ),
    );
  }
}
