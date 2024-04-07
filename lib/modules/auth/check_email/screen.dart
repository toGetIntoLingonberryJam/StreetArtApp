import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/auth/check_email/email_counter.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      title: '',
      paddings: kPagePadding,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ссылка отправлена\n на почту',
                      style: SATextStyles.title1, textAlign: TextAlign.center),
                  SizedBox(height: 24),
                  Text(
                    'Перейдите по ссылке из письма для подтверждения аккаунта',
                    style: SATextStyles.text,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Если письмо не пришло - проверьте "Спам"',
                    style: SATextStyles.caption,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SAPrimaryButton(label: 'Перейти на главную', onTap: Get.back),
              const SizedBox(height: 12),
              const EmailCounterWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
