import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/festival/festival.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_header.dart';
import 'package:street_art_witnesses/widgets/other/image_slider/app_image_slider.dart';

class FestivalScreen extends StatelessWidget {
  const FestivalScreen({super.key, required this.festival});

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: festival.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppImageSlider(images: festival.image == null ? null : [festival.image!]),
            Padding(
              padding: kDensePagePadding,
              child: Column(
                children: [
                  const SizedBox(height: Paddings.small),
                  AppContainer(child: Text(festival.name, style: TextStyles.headline1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
