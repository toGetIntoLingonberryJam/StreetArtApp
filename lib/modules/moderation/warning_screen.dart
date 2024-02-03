import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/blocs/moderation/moderation_cubit.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/buttons/app_checkbox.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';

class ModerationWarningScreen extends StatelessWidget {
  const ModerationWarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              AppAppbar(title: ''),
              SizedBox(height: 20),
              Expanded(child: SizedBox()),
              Text(
                'Добавление работы',
                style: TextStyles.title1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Text(
                'Перед публикацией, все заявки на добавление работ проходят проверку. Это помогает поддерживать высокое качество контента в нашем приложении.\n\nКак только ваша заявка будет одобрена, ваша работа будет опубликована и станет доступна для всех пользователей.\n\nСпасибо за понимание!',
                style: TextStyles.text,
                textAlign: TextAlign.center,
              ),
              Expanded(child: SizedBox()),
              _ConfirmWidget(),
            ],
          ),
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
            context.read<ModerationCubit>().showEdit();
          },
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppCheckBox(value: dontShowAgain, onChanged: (v) => setState(() => dontShowAgain = v)),
            const SizedBox(width: 10),
            const Text('Не показывать снова', style: TextStyles.button),
          ],
        ),
      ],
    );
  }
}
