import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
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
            const SizedBox(height: 60),
            ClipRRect(
              borderRadius: BorderRadius.circular(kContainerRadius),
              child: const AppPlaceholder(height: 320),
            ),
            const Expanded(child: SizedBox()),
            const Text('Спасибо!', style: TextStyles.title1, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            const Text(
              'Ваша заявка на добавление работы отправлена на модерацию.',
              style: TextStyles.text,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            AppCustomButton.filled(
              child: Text(
                'На главный экран',
                style: TextStyles.button.copyWith(color: Colors.black),
              ),
              onTap: () => Navigator.pop(context),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
