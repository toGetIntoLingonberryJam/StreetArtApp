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
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: GetBuilder<CollectionController>(builder: (controller) {
            return Column(
              children: [
                AppAppbar(
                  title: 'Ваша Коллекция',
                  autoImplyLeading: false,
                  action: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: AppButton(
                      onTap: () => controller.switchPage(Collection.artworks),
                      label: 'Работы',
                      isPrimary: controller.coll == Collection.artworks,
                    )),
                    const SizedBox(width: 16),
                    Expanded(
                        child: AppButton(
                      onTap: () => controller.switchPage(Collection.artists),
                      label: 'Работы',
                      isPrimary: controller.coll == Collection.artists,
                    )),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(child: controller.view),
              ],
            );
          }),
        ),
      ),
    );
  }
}
