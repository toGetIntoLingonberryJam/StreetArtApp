import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppAppbar(title: 'Изменить пароль'),
              SizedBox(height: 30),
              Text('Пароль', style: TextStyles.headline1),
              SizedBox(height: 10),
              _ChangePasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangePasswordForm extends StatefulWidget {
  const _ChangePasswordForm();

  @override
  State<_ChangePasswordForm> createState() => __ChangePasswordFormState();
}

class __ChangePasswordFormState extends State<_ChangePasswordForm> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const AppContainer.small(
          child: Text('Введите старый пароль', style: TextStyles.text),
        ),
        const SizedBox(height: 10),
        const AppContainer.small(
          child: Text('Введите новый пароль', style: TextStyles.text),
        ),
        const SizedBox(height: 10),
        const AppContainer.small(
          child: Text('Повторите новый пароль', style: TextStyles.text),
        ),
        const SizedBox(height: 40),
        AppButton.primary(
          onTap: () => Utils.showMessage('Изменения сохранены'),
          label: 'Сохранить',
        ),
      ],
    ));
  }
}
