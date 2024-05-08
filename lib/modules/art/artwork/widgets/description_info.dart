import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/buttons/link_button.dart';

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
          const Text('Описание:', style: NewTextStyles.title3Regular),
          const SizedBox(height: Paddings.small),
          Text(
            description,
            style: NewTextStyles.bodyRegular,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Paddings.small),
          LinkButton('Подробнее', onTap: () => Get.to(() => _DescriptionPage(artwork))),
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
                  LoadingImageCircleAvatar(imageUrl: artwork.location.previewUrl),
                  const SizedBox(width: Paddings.small),
                  Text(artwork.title, style: NewTextStyles.title3Regular),
                ],
              ),
              const SizedBox(height: Paddings.small),
              Text(artwork.description!, style: NewTextStyles.bodyRegular),
            ],
          ),
        ),
      ),
    );
  }
}
