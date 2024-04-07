import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';

import 'image_slider_base.dart';

class AppImageSlider extends StatelessWidget {
  const AppImageSlider({super.key, required this.images});

  final List<ImageModel>? images;

  @override
  Widget build(BuildContext context) {
    if (images == null || images!.isEmpty) return const _NoImagesPlaceholder();

    return Stack(
      children: [
        ImageSliderBase(images: images!),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SAIconButton(
              onTap: () => Utils.showInfo('Добавить в избранное'),
              iconData: Icons.favorite_border,
            ),
          ),
        ),
      ],
    );
  }
}

class _NoImagesPlaceholder extends StatelessWidget {
  const _NoImagesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kContainerRadius),
          child: const SAContainer(
            child: Center(
              child: Text('Фотографии отсутствуют', style: SATextStyles.headline1),
            ),
          ),
        ),
      ),
    );
  }
}
