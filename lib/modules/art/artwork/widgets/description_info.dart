import 'package:flutter/material.dart';
import 'package:street_art_ui_kit/street_art_ui_kit.dart';

class ArtworkDescriptionWidget extends StatelessWidget {
  const ArtworkDescriptionWidget(this.description, {super.key, this.includeBottomPadding = true});

  final String? description;
  final bool includeBottomPadding;

  @override
  Widget build(BuildContext context) {
    if (description == null || description!.isEmpty) return const SizedBox();
    return Padding(
      padding: includeBottomPadding ? const EdgeInsets.only(bottom: 8) : EdgeInsets.zero,
      child: SAContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Описание', style: SATextStyles.headline1),
            const SizedBox(height: 8),
            Text(description!, style: SATextStyles.text),
          ],
        ),
      ),
    );
  }
}
