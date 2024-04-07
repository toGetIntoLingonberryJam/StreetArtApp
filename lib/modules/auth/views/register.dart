import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/auth/controller.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SATextFormField(
            controller: controller.usernameCtrl,
            hintText: 'Введите имя',
            validator: Validator.get(Validate.login),
          ),
          const SizedBox(height: 10),
          SATextFormField(
            controller: controller.emailCtrl,
            hintText: 'Введите почту',
            validator: Validator.get(Validate.email),
          ),
          const SizedBox(height: 10),
          SATextFormField.withToggleEye(
            controller: controller.passwordCtrl,
            hintText: 'Введите пароль',
            validator: Validator.get(Validate.password),
          ),
          const SizedBox(height: 10),
          SATextFormField.withToggleEye(
            controller: controller.passwordConfirmCtrl,
            hintText: 'Повторите пароль',
            validator: (String? password) {
              if (controller.passwordCtrl.text != controller.passwordConfirmCtrl.text) {
                return 'Пароли не совпадают';
              }
              return Validator.get(Validate.password)!(password);
            },
          ),
          const SizedBox(height: 60),
          SAPrimaryButton(
            onTap: () => controller.tryRegister(context),
            label: 'Зарегистрироваться',
          ),
        ],
      ),
    );
  }
}
