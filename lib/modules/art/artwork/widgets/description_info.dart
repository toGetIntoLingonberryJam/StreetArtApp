import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ArtworkDescriptionWidget extends StatelessWidget {
  const ArtworkDescriptionWidget(this.artwork, {super.key});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    final description = artwork.description;
    if (description == null || description.isEmpty) return const SizedBox();
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Описание:', style: TextStyles.headline1),
          const SizedBox(height: Paddings.small),
          Text(
            description,
            style: TextStyles.text,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Paddings.small),
          GestureDetector(
            onTap: () => Get.to(() => _DescriptionPage(artwork)),
            child: Text(
              'Подробнее',
              style: TextStyles.text.copyWith(
                fontWeight: FontWeight.w500,
                color: UIColors.accent,
                decoration: TextDecoration.underline,
                decorationColor: UIColors.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  const _DescriptionPage(this.artwork);

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'Описание'),
      body: SingleChildScrollView(
        padding: kDensePagePadding,
        child: AppContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppCircleAvatar(radius: 16, image: AppPlaceholder.assetImage()),
                  const SizedBox(width: Paddings.small),
                  Text(artwork.title, style: TextStyles.headline1),
                ],
              ),
              const SizedBox(height: Paddings.small),
              Text(artwork.description!, style: TextStyles.text),
            ],
          ),
        ),
      ),
    );
  }
}
