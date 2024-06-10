import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/moderation/screens/edit.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ModerationThanksScreen extends StatelessWidget {
  const ModerationThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'Спасибо!'),
      body: Padding(
        padding: kPagePadding,
        child: Column(
          children: [
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(kContainerRadius),
              child: const AppPlaceholder(width: double.infinity),
            ),
            const Spacer(),
            const Text('Спасибо!', style: NewTextStyles.largeTitleRegular, textAlign: TextAlign.center),
            const SizedBox(height: Paddings.normal),
            const Text(
              'Ваша заявка на добавление работы отправлена на модерацию.',
              style: NewTextStyles.bodyRegular,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Paddings.normal),
            AppButton.primary(
              label: 'Добавить еще работу',
              onTap: () => replaceScreen(const ModerationEditScreen()),
            ),
            const SizedBox(height: 12),
            const AppButton.secondary(label: 'На главный экран', onTap: closeScreen),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
