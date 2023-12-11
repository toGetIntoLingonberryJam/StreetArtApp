import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

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
      onTap: () => Utils.tryLaunchUrl(context, url),
      child: Row(
        children: [
          const Icon(Icons.link),
          const SizedBox(width: 8),
          Text(name,
              style: TextStyles.text.copyWith(
                decoration: TextDecoration.underline,
              )),
        ],
      ),
    );
  }
}
