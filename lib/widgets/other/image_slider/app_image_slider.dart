import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/image.dart';
import 'package:street_art_witnesses/widgets/buttons/app_icon_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/slider_base.dart';

class AppImageSlider extends StatelessWidget {
  const AppImageSlider({super.key, required this.images});

  // final List<ArtworkImage>? images;
  final List<ImageSchema>? images;

  @override
  Widget build(BuildContext context) {
    if (images == null || images!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
        child: AppContainer.small(
          child: Text(
            'Фотографии отсутствуют',
            style: TextStyles.headline1,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Stack(
      children: [
        ImageSliderBase(images: images!),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                AppIconButton(onTap: Get.back, iconData: Icons.arrow_back),
                const Expanded(child: SizedBox()),
                AppIconButton(
                  onTap: () => Utils.showInfo('Добавить в избранное'),
                  iconData: Icons.favorite_border,
                ),
              ],
            )),
      ],
    );
  }
}
