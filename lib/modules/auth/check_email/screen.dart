import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/auth/check_email/email_counter.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.normal),
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Ссылка отправлена на почту', style: NewTextStyles.largeTitleRegular, textAlign: TextAlign.center),
                      SizedBox(height: 24),
                      Text(
                        'Перейдите по ссылке из письма для подтверждения аккаунта',
                        style: NewTextStyles.bodyRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Если письмо не пришло - проверьте "Спам"',
                        style: NewTextStyles.caption1Regular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  AppButton.primary(label: 'Перейти на главную', onTap: Get.back),
                  const SizedBox(height: 12),
                  const EmailCounterWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
