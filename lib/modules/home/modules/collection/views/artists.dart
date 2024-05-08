import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/artist_preview_widget.dart';
import 'package:street_art_witnesses/widgets/containers/grid_column.dart';
import 'package:street_art_witnesses/widgets/loaders.dart';

class ArtistsView extends StatelessWidget {
  const ArtistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPagePadding,
      child: GetBuilder<CollectionController>(
        builder: (controller) {
          if (controller.isLoadingArtists) return Loaders.collection(controller.artists.length);

          if (controller.artists.isEmpty) {
            return const Center(child: Text('Здесь будут ваши любимые авторы', style: NewTextStyles.bodyRegular));
          }

          final previews = controller.artists.values;
          return GridColumn(
            isScrollable: true,
            itemCount: previews.length,
            itemBuilder: (context, index) => ArtistPreviewWidget(previews.elementAt(index), showLike: true),
            crossAxisCount: 1,
            childAspectRatio: 2.23,
            // widgetHeight: 120,
          );
        },
      ),
    );
  }
}

class ArtistCard extends StatelessWidget {
  const ArtistCard(this.artist, {super.key});

  final ArtistPreview artist;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingImageCircleAvatar(imageUrl: artist.previewUrl, radius: 50),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.centerLeft,
              child: Text(artist.name, style: NewTextStyles.title3Regular),
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
