import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artists.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artworks.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/festivals.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppHeader(
          title: 'Избранное',
          autoImplyLeading: false,
          // action: GestureDetector(onTap: () {}, child: const Icon(Icons.search)),
        ),
        body: Padding(
          // padding: kPagePadding,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              TabBar(
                labelPadding: EdgeInsets.zero,
                labelStyle: NewTextStyles.bodyBold,
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: Paddings.normal),
                labelColor: UIColors.textPrimary,
                unselectedLabelColor: UIColors.textSecondary,
                dividerHeight: 0,
                tabs: [
                  Tab(text: 'Работы'),
                  Tab(text: 'Авторы'),
                  Tab(text: 'Фестивали'),
                ],
              ),
              SizedBox(height: Paddings.normal),
              Expanded(
                child: TabBarView(
                  children: [
                    ArtworksView(),
                    ArtistsView(),
                    FestivalsView(),
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
