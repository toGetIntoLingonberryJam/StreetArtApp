import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/address_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/description_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/festival_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/artwork_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/links_info.dart';
import 'package:street_art_witnesses/modules/art/artwork/widgets/status_info.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/image_slider/app_image_slider.dart';

class ArtworkScreen extends StatelessWidget {
  const ArtworkScreen({super.key, required this.artwork}) : preview = false;
  const ArtworkScreen.preview({super.key, required this.artwork}) : preview = true;

  final Artwork? artwork;
  final bool preview;

  @override
  Widget build(BuildContext context) {
    if (artwork == null) return const SAErrorScreen(errorMessage: 'Не удалось загрузить работу');

    return SAScaffold(
      title: preview ? null : artwork!.title,
      header: preview ? SAHeader(title: artwork!.title, autoImplyLeading: false) : null,
      body: SingleChildScrollView(
        padding: kDensePagePadding,
        child: IgnorePointer(
          ignoring: preview,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImageSlider(images: artwork!.images),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ArtworkInfo(artwork: artwork!),
                    const SizedBox(height: 8),
                    FestivalInfoWidget(artwork!.festivalPreview),
                    if (artwork!.festivalPreview != null) const SizedBox(height: 8),
                    AddressInfo(artwork: artwork!, preview: preview),
                    const SizedBox(height: 8),
                    ArtworkDescriptionWidget(artwork!.description),
                    StatusInfo(artwork!.status),
                    const SizedBox(height: 8),
                    LinksInfo(artwork!.links),
                    if (artwork!.links != null) const SizedBox(height: 8),
                    // const SAContainer.small(
                    //   child: Text('Добавлено: юзернейм', style: TextStyles.headline2),
                    // // ),
                    // const SizedBox(height: 8),
                    const _WriteUsWidget(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WriteUsWidget extends StatelessWidget {
  const _WriteUsWidget();

  @override
  Widget build(BuildContext context) {
    return SAContainer.small(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Есть неточности?',
            style: SATextStyles.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () => Utils.tryLaunchUrl(reportLink),
            child: Text(
              'Напишите',
              style: SATextStyles.headline2.copyWith(decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
