import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_image.dart';
import 'package:street_art_witnesses/src/providers/slider_provider.dart';
import 'package:street_art_witnesses/src/services/images_service.dart';
import 'package:street_art_witnesses/widgets/slider_dots.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key, required this.images});

  final List<ArtworkImage> images;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderProvider(length: images.length),
      child: _ImageSlider(images: images),
    );
  }
}

class _ImageSlider extends StatelessWidget {
  const _ImageSlider({required this.images});

  final List<ArtworkImage> images;

  @override
  Widget build(BuildContext context) {
    final sliderProvider = context.read<SliderProvider>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kContainerRadius),
          child: SizedBox(
            height: 400,
            child: PageView.builder(
              physics: const ClampingScrollPhysics(),
              onPageChanged: (value) => sliderProvider.updateIndex(value),
              itemCount: sliderProvider.length,
              itemBuilder: (context, index) {
                final image = images[index];
                final imageLoader = ImagesService.loadFromDisk(
                  image.imageUrl,
                  quality: ImageQuality.l,
                );

                return LoadingImage(imageLoader: imageLoader);
              },
            ),
          ),
        ),
        Consumer<SliderProvider>(
          builder: (_, slider, __) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SliderDots(count: slider.length, activeIndex: slider.index),
          ),
        ),
      ],
    );
  }
}

class LoadingImage extends StatelessWidget {
  const LoadingImage({super.key, required this.imageLoader});

  final Future<ImageProvider?> imageLoader;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imageLoader,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image(
            image: snapshot.data!,
            fit: BoxFit.cover,
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Не удалось загрузить картинку',
              style: TextStyles.headline1,
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
