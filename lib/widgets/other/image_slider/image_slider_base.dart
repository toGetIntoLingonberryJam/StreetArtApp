import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/image/image.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
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
            children:
                imageLoaders.map((imageLoader) => LoadingImage(imageLoader: imageLoader)).toList(),
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
              return const Skeleton();
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
        return const Skeleton();
      },
    );
  }
}
