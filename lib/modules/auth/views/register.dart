import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';
import 'package:street_art_witnesses/modules/auth/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormField(
            controller: controller.usernameCtrl,
            hintText: 'Введите имя',
            validator: Validator.get(Validate.login),
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            controller: controller.emailCtrl,
            hintText: 'Введите почту',
            validator: Validator.get(Validate.email),
          ),
          const SizedBox(height: 10),
          AppTextFormField.withToggleEye(
            controller: controller.passwordCtrl,
            hintText: 'Введите пароль',
            validator: Validator.get(Validate.password),
          ),
          const SizedBox(height: 10),
          AppTextFormField.withToggleEye(
            controller: controller.passwordConfirmCtrl,
            hintText: 'Повторите пароль',
            validator: (password) {
              if (controller.passwordCtrl.text != controller.passwordConfirmCtrl.text) {
                return 'Пароли не совпадают';
              }
              return Validator.get(Validate.password)!(password);
            },
          ),
          const SizedBox(height: 60),
          AppButton.primary(
            onTap: () => controller.tryRegister(context),
            label: 'Зарегистрироваться',
          ),
        ],
      ),
    );
  }
}
