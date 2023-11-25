import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/widgets/app_container.dart';

class DescriptionInfo extends StatelessWidget {
  const DescriptionInfo(this.description, {super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Описание:', style: TextStyles.titles.w700),
          const SizedBox(height: 8),
          Text(description, style: TextStyles.headlines.w400),
        ],
      ),
    );
  }
}
