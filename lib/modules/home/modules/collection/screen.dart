import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: 'Ваша Коллекция',
        autoImplyLeading: false,
        action: GestureDetector(onTap: () {}, child: const Icon(Icons.search)),
      ),
      body: Padding(
        padding: kPagePadding,
        child: GetBuilder<CollectionController>(builder: (controller) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: AppTextButton(
                    onTap: () => controller.switchPage(Collection.artworks),
                    text: 'Работы',
                    isFilled: controller.coll == Collection.artworks,
                  )),
                  const SizedBox(width: 16),
                  Expanded(
                      child: AppTextButton(
                    onTap: () => controller.switchPage(Collection.artists),
                    text: 'Авторы',
                    isFilled: controller.coll == Collection.artists,
                  )),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppTextButton(
                      onTap: () => controller.switchPage(Collection.festivals),
                      text: 'Фестивали',
                      isFilled: controller.coll == Collection.festivals,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(child: controller.view),
            ],
          );
        }),
      ),
    );
  }
}
