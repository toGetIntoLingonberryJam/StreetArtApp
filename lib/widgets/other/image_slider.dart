import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_image.dart';
import 'package:street_art_witnesses/data/providers/slider_provider.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';
import 'package:street_art_witnesses/widgets/other/slider_dots.dart';

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

class _ImageSlider extends StatefulWidget {
  const _ImageSlider({required this.images});

  final List<ArtworkImage> images;

  @override
  State<_ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<_ImageSlider> {
  late List<Future<ImageProvider?>> imageLoaders;

  @override
  void initState() {
    imageLoaders = List.generate(
      widget.images.length,
      (i) => ImagesService.loadFromDisk(
        widget.images[i].imageUrl,
        quality: Get.find<SettingsService>().imageQuality,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sliderProvider = context.read<SliderProvider>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 400,
          child: PageView(
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) => sliderProvider.updateIndex(value),
            children: imageLoaders
                .map(
                  (imageLoader) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kContainerRadius),
                      child: LoadingImage(imageLoader: imageLoader),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        if (widget.images.length > 1)
          Consumer<SliderProvider>(
            builder: (_, slider, __) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
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
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              if (loadingProgress.expectedTotalBytes != null) {
                return Center(
                  child: AppLoadingIndicator(
                    value:
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!,
                  ),
                );
              }
              return const Center(child: AppLoadingIndicator());
            },
            image: snapshot.data!,
            fit: BoxFit.cover,
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Не удалось загрузить картинку',
              style: TextStyles.headline1,
              textAlign: TextAlign.center,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
