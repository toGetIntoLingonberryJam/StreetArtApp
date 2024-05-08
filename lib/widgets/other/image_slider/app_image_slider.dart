import 'package:flutter/material.dart';
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
    return const AppPlaceholder(width: double.infinity, height: 400);

    // return const SizedBox(
    //   height: 400,
    //   child: Material(
    //     color: UIColors.backgroundCard,
    //     child: Center(
    //       child: Text('Фотографии отсутствуют', style: NewTextStyles.title3Regular),
    //     ),
    //   ),
    // );
  }
}
