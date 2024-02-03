import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';

class StatusInfo extends StatelessWidget {
  const StatusInfo(this.status, {super.key});

  final ArtworkStatus status;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Состояние работы', style: TextStyles.headline1),
          const SizedBox(height: 10),
          Text(_statusToString(status), style: TextStyles.text),
          // const Text(
          //   'юзернейм и юзернейм отметили, что эта работа затегана',
          //   style: TextStyles.caption,
          // ),
        ],
      ),
    );
  }
}

String _statusToString(ArtworkStatus status) {
  // Статус работы:
  switch (status) {
    case ArtworkStatus.existing:
      return 'Существует';
    case ArtworkStatus.destroyed:
      return 'Уничтожена';
    case ArtworkStatus.overpainted:
      return 'Закрашена';
    case ArtworkStatus.unknown:
      return 'Неизвествен';
  }
}
