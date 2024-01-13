import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/containers/app_circle_avatar.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class FestivalInfo extends StatelessWidget {
  const FestivalInfo(this.festivalId, {super.key});

  final int? festivalId;

  @override
  Widget build(BuildContext context) {
    if (festivalId == null) return const SizedBox();

    return AppContainer.small(
      child: Row(
        children: [
          AppCircleAvatar(image: AppPlaceholder.assetImage()),
          const SizedBox(width: 8),
          Expanded(
            child: Text('Festival ID: $festivalId', style: TextStyles.headline1),
          ),
        ],
      ),
    );
  }
}
