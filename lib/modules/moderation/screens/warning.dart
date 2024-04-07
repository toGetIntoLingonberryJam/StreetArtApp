import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/moderation/screens/edit.dart';

class ModerationWarningScreen extends StatelessWidget {
  const ModerationWarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SAScaffold(
      title: 'Добавление работы',
      body: Padding(
        padding: kPagePadding,
        child: Column(
          children: [
            Spacer(),
            Text(
              'Добавление работы',
              style: SATextStyles.title1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              'Перед публикацией, все заявки на добавление работ проходят проверку. Это помогает поддерживать высокое качество контента в нашем приложении.\n\nКак только ваша заявка будет одобрена, ваша работа будет опубликована и станет доступна для всех пользователей.\n\nСпасибо за понимание!',
              style: SATextStyles.text,
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
        SAPrimaryButton(
          label: 'Я ознакомился',
          onTap: () {
            if (dontShowAgain) {
              Get.find<SettingsService>().dontShowAgain(ShowPages.moderationWarning);
            }
            Get.off(() => const ModerationEditScreen());
          },
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SACheckBox(value: dontShowAgain, onChanged: (v) => setState(() => dontShowAgain = v)),
            const SizedBox(width: 10),
            const Text('Не показывать снова', style: SATextStyles.button),
          ],
        ),
      ],
    );
  }
}
