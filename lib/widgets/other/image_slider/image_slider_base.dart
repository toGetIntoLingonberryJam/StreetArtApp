import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/controller.dart';

class ImageSliderBase extends StatefulWidget {
  const ImageSliderBase({super.key, required this.images});

  final List<ImageModel> images;

  @override
  State<ImageSliderBase> createState() => _ImageSliderBaseState();
}

class _ImageSliderBaseState extends State<ImageSliderBase> {
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
    final controller = Get.put(SliderController(length: widget.images.length));

    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          PageView(
            controller: PageController(viewportFraction: 0.99999),
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) => controller.updateIndex(value),
            children: imageLoaders.indexed
                .map((data) => LoadingImage(
                      imageLoader: data.$2,
                      index: data.$1 + 1,
                      length: imageLoaders.length,
                    ))
                .toList(),
          ),
          if (widget.images.length > 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: Paddings.small),
                child: GetBuilder<SliderController>(
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
  const LoadingImage({
    super.key,
    required this.imageLoader,
    required this.index,
    required this.length,
  });

  final Future<ImageProvider?> imageLoader;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imageLoader,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () => Get.to(() => _OpenedImage(
                  image: snapshot.data!,
                  index: index,
                  length: length,
                )),
            child: Image(
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Skeleton();
              },
              image: snapshot.data!,
              fit: BoxFit.cover,
            ),
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
        return const Skeleton();
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
