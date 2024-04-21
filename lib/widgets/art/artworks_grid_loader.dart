import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';
import 'package:street_art_witnesses/widgets/art/artwork_preview_widget.dart';
import 'package:street_art_witnesses/widgets/buttons/link_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/containers/grid_column.dart';
import 'package:street_art_witnesses/widgets/other/app_error.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';

class ArtworksGridLoader extends StatelessWidget {
  const ArtworksGridLoader({super.key, required this.artworksFuture, this.showAuthor = true, this.columns = 2});

  final Future<List<ArtworkPreview>?> artworksFuture;
  final int columns;
  final bool showAuthor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppContainer(
          color: UIColors.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Работы', style: TextStyles.headline1),
              LinkButton('Показать все'),
            ],
          ),
        ),
        const SizedBox(height: Paddings.small),
        FutureBuilder(
          future: artworksFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AppLoadingIndicator();
            } else if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Работы отсутствуют', style: TextStyles.headline1),
                );
              } else {
                return GridColumn(
                  crossAxisCount: columns,
                  childAspectRatio: 0.68,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final preview = snapshot.data![index];
                    return ArtworkPreviewWidget(preview, showAuthor: showAuthor);
                  },
                );
              }
            }
            return const AppErrorWidget();
          },
        ),
      ],
    );
  }
}
