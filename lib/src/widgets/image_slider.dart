import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/providers/slider_provider.dart';
import 'package:street_art_witnesses/src/widgets/app_placeholder.dart';
import 'package:street_art_witnesses/src/widgets/slider_dots.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key, required this.length});

  final int length;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderProvider(length: length),
      child: const _ImageSlider(),
    );
  }
}

class _ImageSlider extends StatelessWidget {
  const _ImageSlider();

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
                return const AppPlaceholder();
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
