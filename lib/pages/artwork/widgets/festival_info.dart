import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/widgets/app_circle_avatar.dart';
import 'package:street_art_witnesses/src/widgets/app_container.dart';
import 'package:street_art_witnesses/src/widgets/app_placeholder.dart';

class FestivalInfo extends StatelessWidget {
  const FestivalInfo(this.festival, {super.key});

  final String? festival;

  @override
  Widget build(BuildContext context) {
    return AppContainer.small(
      child: Row(
        children: [
          AppCircleAvatar(image: AppPlaceholder.assetImage()),
          const SizedBox(width: 8),
          Expanded(
            child: Text(festival ?? 'Информация о фестивале отсутствует'),
          ),
        ],
      ),
    );
  }
}
