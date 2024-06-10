import 'dart:math';

import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_preview/artwork_preview.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/art/artwork_preview_widget.dart';
import 'package:street_art_witnesses/widgets/buttons/link_button.dart';
import 'package:street_art_witnesses/widgets/containers/grid_column.dart';

class ArtworksGridLoader extends StatelessWidget {
  const ArtworksGridLoader({
    super.key,
    required this.artworksFuture,
    required this.title,
    this.showAuthor = true,
    this.maxItems = 4,
    this.columns = 2,
  });

  final Future<List<ArtworkPreview>?> artworksFuture;
  final int columns;
  final String title;
  final bool showAuthor;
  final int? maxItems;

  void showAll(BuildContext context, List<ArtworkPreview> previews) {
    openScreen(_ShowAllScreen(title, previews));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: artworksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingIndicator();
        } else if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Работы отсутствуют', style: NewTextStyles.title3Bold),
            );
          } else {
            return Column(
              children: [
                AppContainer(
                  color: UIColors.background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Работы', style: NewTextStyles.title3Bold),
                      LinkButton('Показать все', onTap: () => showAll(context, snapshot.data!)),
                    ],
                  ),
                ),
                const SizedBox(height: Paddings.small),
                GridColumn(
                  crossAxisCount: columns,
                  childAspectRatio: 0.68,
                  itemCount: maxItems == null ? snapshot.data!.length : min(snapshot.data!.length, maxItems!),
                  // itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final preview = snapshot.data![index];
                    return ArtworkPreviewWidget(preview, showAuthor: showAuthor);
                  },
                ),
              ],
            );
          }
        }
        return const AppErrorWidget();
      },
    );
  }
}

class _ShowAllScreen extends StatelessWidget {
  const _ShowAllScreen(this.title, this.previews);

  final String title;
  final List<ArtworkPreview> previews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: title),
      body: Padding(
        padding: kPagePadding,
        child: GridColumn(
          isScrollable: true,
          itemCount: previews.length,
          itemBuilder: (context, index) => ArtworkPreviewWidget(previews.elementAt(index), showLike: true),
          crossAxisCount: 1,
          childAspectRatio: 2,
        ),
      ),
    );
  }
}
