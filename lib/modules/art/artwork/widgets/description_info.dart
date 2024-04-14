import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';

class ArtworkDescriptionWidget extends StatelessWidget {
  const ArtworkDescriptionWidget(this.description, {super.key, this.includeBottomPadding = true});

  final String? description;
  final bool includeBottomPadding;

  @override
  Widget build(BuildContext context) {
    if (description == null || description!.isEmpty) return const SizedBox();
    return Padding(
      padding: includeBottomPadding ? const EdgeInsets.only(bottom: 8) : EdgeInsets.zero,
      child: AppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Описание', style: TextStyles.headline1),
            const SizedBox(height: Paddings.small),
            Text(description!, style: TextStyles.text),
          ],
        ),
      ),
    );
  }
}
