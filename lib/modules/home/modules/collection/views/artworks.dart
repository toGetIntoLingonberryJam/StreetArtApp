import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/artwork_preview_widget.dart';
import 'package:street_art_witnesses/widgets/containers/grid_column.dart';

class ArtworksView extends StatelessWidget {
  const ArtworksView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionController>(
      builder: (controller) {
        if (controller.isLoadingArtworks) {
          return _loader();
        }
        if (controller.artworks.isEmpty) {
          return const Center(child: Text('У вас нет сохраненных работ', style: TextStyles.headline2));
        }

        final previews = controller.artworks.values;
        return GridColumn(
          isScrollable: true,
          itemCount: previews.length,
          itemBuilder: (context, index) => ArtworkPreviewWidget(previews.elementAt(index), showLike: true),
          crossAxisCount: 1,
          childAspectRatio: 2.23,
        );
      },
    );
  }

  GridColumn _loader() {
    return GridColumn(
      isScrollable: true,
      itemCount: 6,
      itemBuilder: (context, index) => const Skeleton(),
      crossAxisCount: 1,
      childAspectRatio: 2.23,
    );
  }
}

class ArtworkCard extends StatelessWidget {
  const ArtworkCard(this.preview, {super.key});

  final ArtworkPreview preview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: UIColors.backgroundCard, borderRadius: BorderRadius.circular(18)),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 100,
                height: 100,
                color: UIColors.slider,
                child: preview.previewUrl == null ? const AppPlaceholder() : LoadingImage.fromPreviewUrl(preview.previewUrl!),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          preview.artistPreview?.name ?? 'Автор неизвестен',
                          style: TextStyles.text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5), child: Icon(Icons.favorite)),
                    ],
                  ),
                  Text(preview.title, style: TextStyles.headline1, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const Expanded(child: SizedBox()),
                  Text(preview.address, style: TextStyles.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
