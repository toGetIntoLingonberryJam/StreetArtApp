import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/buttons/app_text_button.dart';

class StateInfo extends StatelessWidget {
  const StateInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Состояние работы', style: TextStyles.titles.w500),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              AppTextButton.outlined(onTap: () {}, text: 'Закрашено'),
              AppTextButton.filled(onTap: () {}, text: 'Затегано'),
              AppTextButton.outlined(onTap: () {}, text: 'Стерлось'),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'юзернейм и юзернейм отметили, что эта работа затегана',
            style: TextStyles.captions.w500,
          )
        ],
      ),
    );
  }
}
