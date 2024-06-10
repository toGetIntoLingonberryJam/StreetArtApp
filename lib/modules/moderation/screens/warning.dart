import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/moderation/screens/edit.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ModerationWarningScreen extends StatelessWidget {
  const ModerationWarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppHeader(title: 'Добавление работы'),
      body: Padding(
        padding: kPagePadding,
        child: Column(
          children: [
            Spacer(),
            Text(
              'Добавление работы',
              style: NewTextStyles.largeTitleRegular,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              'Перед публикацией, все заявки на добавление работ проходят проверку. Это помогает поддерживать высокое качество контента в нашем приложении.\n\nКак только ваша заявка будет одобрена, ваша работа будет опубликована и станет доступна для всех пользователей.\n\nСпасибо за понимание!',
              style: NewTextStyles.bodyRegular,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            _ConfirmWidget(),
          ],
        ),
      ),
    );
  }
}

class _ConfirmWidget extends StatefulWidget {
  const _ConfirmWidget();

  @override
  State<_ConfirmWidget> createState() => _ConfirmWidgetState();
}

class _ConfirmWidgetState extends State<_ConfirmWidget> {
  bool dontShowAgain = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton.primary(
          label: 'Я ознакомился',
          onTap: () {
            if (dontShowAgain) {
              Get.find<SettingsService>().dontShowAgain(ShowPages.moderationWarning);
            }
            replaceScreen(const ModerationEditScreen());
          },
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppCheckBox(value: dontShowAgain, onChanged: (v) => setState(() => dontShowAgain = v)),
            const SizedBox(width: 10),
            const Text('Не показывать снова', style: NewTextStyles.headlineMedium),
          ],
        ),
      ],
    );
  }
}
