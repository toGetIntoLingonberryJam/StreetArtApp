import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppHeader(title: 'Изменить пароль'),
      body: Padding(
        padding: kPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Пароль', style: NewTextStyles.title3Regular),
            SizedBox(height: 10),
            _ChangePasswordForm(),
          ],
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
        const AppContainer(
          child: Text('Введите старый пароль', style: NewTextStyles.bodyRegular),
        ),
        const SizedBox(height: 10),
        const AppContainer(
          child: Text('Введите новый пароль', style: NewTextStyles.bodyRegular),
        ),
        const SizedBox(height: 10),
        const AppContainer(
          child: Text('Повторите новый пароль', style: NewTextStyles.bodyRegular),
        ),
        const SizedBox(height: 40),
        AppButton.primary(
          onTap: () => Utils.showInfo('Изменения сохранены'),
          label: 'Сохранить',
        ),
      ],
    ));
  }
}
