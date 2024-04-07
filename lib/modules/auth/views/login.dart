import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/auth/controller.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SATextFormField(
            controller: controller.emailCtrl,
            hintText: 'Почта',
            validator: Validator.get(Validate.email),
          ),
          const SizedBox(height: 10),
          SATextFormField.withToggleEye(
            controller: controller.passwordCtrl,
            hintText: 'Пароль',
            validator: Validator.get(Validate.password),
          ),
          const SizedBox(height: 60),
          SAPrimaryButton(onTap: () => controller.tryLogin(context), label: 'Войти в профиль'),
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
        style: SATextStyles.text.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
