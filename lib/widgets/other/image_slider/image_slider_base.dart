import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/controller.dart';

class ImageSliderBase extends StatelessWidget {
  const ImageSliderBase({super.key, required this.images});

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    final tag = images.hashCode.toString();
    final controller = Get.put(SliderController(length: images.length), tag: tag);

    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          PageView(
            controller: PageController(viewportFraction: 0.99999),
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) => controller.updateIndex(value),
            children: images.map((image) => LoadingImage(image)).toList(),
          ),
          if (images.length > 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: Paddings.small),
                child: GetBuilder<SliderController>(
                  tag: tag,
                  builder: (slider) => SliderDots(count: slider.length, activeIndex: slider.index),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class LoadingImage extends StatelessWidget {
  LoadingImage(ImageModel image, {super.key})
      : imageLoader = ImagesService.loadFromDisk(image.imageUrl),
        blurhash = image.blurhash;

  LoadingImage.fromUrl(
    String url, {
    super.key,
  })  : imageLoader = ImagesService.loadFromDisk(url),
        blurhash = null;

  final Future<ImageProvider?> imageLoader;
  final String? blurhash;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imageLoader,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image(
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return blurhash == null ? const SizedBox() : BlurHash(hash: blurhash!);
              }
              return child;
            },
            image: snapshot.data!,
            fit: BoxFit.cover,
          );
        }

        if (snapshot.hasError) {
          Logger.e(snapshot.error!);
          return const Center(
            child: Text('Не удалось загрузить картинку', style: NewTextStyles.title3Regular, textAlign: TextAlign.center),
          );
        }
        return blurhash == null ? const SizedBox() : BlurHash(hash: blurhash!);
      },
    );
  }
}

class _OpenedImage extends StatelessWidget {
  const _OpenedImage({required this.image, required this.index, required this.length});

  final int index;
  final int length;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: '$index из $length'),
      body: Column(
        children: [
          const Spacer(),
          Image(image: image, fit: BoxFit.contain),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
