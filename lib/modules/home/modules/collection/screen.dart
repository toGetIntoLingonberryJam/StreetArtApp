import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artworks.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const AppHeader(
          title: 'Избранное',
          autoImplyLeading: false,
          // action: GestureDetector(onTap: () {}, child: const Icon(Icons.search)),
        ),
        body: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              TabBar(
                labelPadding: EdgeInsets.zero,
                labelStyle: TextStyles.text.copyWith(fontWeight: FontWeight.w500),
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                labelColor: UIColors.textPrimary,
                unselectedLabelColor: UIColors.textSecondary,
                tabs: const [
                  Tab(text: 'Работы'),
                  Tab(text: 'Авторы'),
                  Tab(text: 'Фестивали'),
                ],
              ),
              const SizedBox(height: Paddings.normal),
              const Expanded(
                child: TabBarView(
                  children: [
                    ArtworksView(),
                    Icon(Icons.person),
                    Icon(Icons.festival),
                    // ArtistsView(artists: artists),
                    // FestivalsView(festsPrevs: festsPrevs),
                  ],
                ),
              ),
            ],
          ),
          // child: GetBuilder<CollectionController>(builder: (controller) {
          //   return Column(
          //     children: [
          //       Row(
          //         children: [
          //           Expanded(
          //             child: AppButton(
          //               onTap: () => controller.switchPage(CollectionType.artworks),
          //               label: 'Работы',
          //               isPrimary: controller.coll == CollectionType.artworks,
          //             ),
          //           ),
          //           const SizedBox(width: 16),
          //           Expanded(
          //               child: AppButton(
          //             onTap: () => controller.switchPage(CollectionType.artists),
          //             label: 'Авторы',
          //             isPrimary: controller.coll == CollectionType.artists,
          //           )),
          //           const SizedBox(width: 16),
          //           Expanded(
          //             child: AppButton(
          //               onTap: () => controller.switchPage(CollectionType.festivals),
          //               label: 'Фестивали',
          //               isPrimary: controller.coll == CollectionType.festivals,
          //             ),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(height: Paddings.normal),
          //       Expanded(child: controller.view),
          //     ],
          //   );
          // }),
        ),
      ),
    );
  }
}
