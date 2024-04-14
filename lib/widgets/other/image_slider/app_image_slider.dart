import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class AppImageSlider extends StatelessWidget {
  const AppImageSlider({super.key, required this.images});

  final List<ImageModel>? images;

  @override
  Widget build(BuildContext context) {
    if (images == null || images!.isEmpty) return const _NoImagesPlaceholder();

    return ImageSliderBase(images: images!);
  }
}

class _NoImagesPlaceholder extends StatelessWidget {
  const _NoImagesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 380,
      child: Material(
        color: UIColors.backgroundCard,
        child: Center(
          child: Text('Фотографии отсутствуют', style: TextStyles.headline1),
        ),
      ),
    );
  }
}
