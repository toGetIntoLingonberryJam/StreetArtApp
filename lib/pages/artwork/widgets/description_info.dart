import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';

class DescriptionInfo extends StatelessWidget {
  const DescriptionInfo(this.description, {super.key});

  final String? description;

  @override
  Widget build(BuildContext context) {
    if (description == null) return const SizedBox();
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Описание', style: TextStyles.headline1),
          const SizedBox(height: 8),
          Text(description!, style: TextStyles.text),
        ],
      ),
    );
  }
}
