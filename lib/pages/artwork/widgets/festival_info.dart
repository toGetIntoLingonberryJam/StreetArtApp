import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class FestivalInfo extends StatelessWidget {
  const FestivalInfo(this.festival, {super.key});

  final String? festival;

  @override
  Widget build(BuildContext context) {
    if (festival == null) {
      return const AppContainer.small(
        child: Text(
          'Информация о фестивале отсутствует',
          style: TextStyles.headline2,
          textAlign: TextAlign.center,
        ),
      );
    }

    return AppContainer.small(
      child: Row(
        children: [
          AppCircleAvatar(image: AppPlaceholder.assetImage()),
          const SizedBox(width: 8),
          Expanded(
            child: Text(festival!, style: TextStyles.headline1),
          ),
        ],
      ),
    );
  }
}
