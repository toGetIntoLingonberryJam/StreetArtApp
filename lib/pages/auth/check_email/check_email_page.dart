import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/auth/check_email/email_counter.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';

class CheckEmailPage extends StatelessWidget {
  const CheckEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Ссылка отправлена на почту',
                          style: TextStyles.title1,
                          textAlign: TextAlign.center),
                      SizedBox(height: 24),
                      Text(
                        'Перейдите по ссылке из письма для подтверждения аккаунта',
                        style: TextStyles.text,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Если письмо не пришло - проверьте "Спам"',
                        style: TextStyles.caption,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  AppButton.primary(
                    text: 'Перейти на главную',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(height: 12),
                  const EmailCounter(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
