import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/auth/controller.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/other/app_text_form_field.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormField(
            controller: controller.emailCtrl,
            hintText: 'Почта',
            validator: Validator.get(Validate.email),
          ),
          const SizedBox(height: 10),
          AppTextFormField.withToggleEye(
            controller: controller.passwordCtrl,
            hintText: 'Пароль',
            validator: Validator.get(Validate.password),
          ),
          const SizedBox(height: 60),
          AppButton.primary(onTap: () => controller.tryLogin(context), label: 'Войти в профиль'),
          const SizedBox(height: 20),
          _forgotPasswordButton(),
        ],
      ),
    );
  }

  GestureDetector _forgotPasswordButton() {
    return GestureDetector(
      child: Text(
        'Забыли пароль?',
        style: TextStyles.text.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
