import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/festival/preview/festival_preview.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/festival_preview_widget.dart';
import 'package:street_art_witnesses/widgets/containers/grid_column.dart';
import 'package:street_art_witnesses/widgets/loaders.dart';

class FestivalsView extends StatelessWidget {
  const FestivalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPagePadding,
      child: GetBuilder<CollectionController>(
        builder: (controller) {
          if (controller.isLoadingFestivals) return Loaders.collection(controller.festivals.length);

          if (controller.festivals.isEmpty) {
            return const Center(child: Text('Здесь будут ваши любимые фестивали', style: TextStyles.headline2));
          }

          final previews = controller.festivals.values;
          return GridColumn(
            isScrollable: true,
            itemCount: previews.length,
            itemBuilder: (context, index) => FestivalPreviewWidget(previews.elementAt(index), showLike: true),
            crossAxisCount: 1,
            childAspectRatio: 1.5,
            // childAspectRatio: 2.23,
            // widgetHeight: 120,
          );
        },
      ),
    );
  }
}

class FestCard extends StatelessWidget {
  const FestCard(this.preview, {super.key});

  final FestivalPreview preview;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingImageCircleAvatar(imageUrl: preview.image?.imageUrl, radius: 50),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.centerLeft,
              child: Text(preview.name, style: TextStyles.headline1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
