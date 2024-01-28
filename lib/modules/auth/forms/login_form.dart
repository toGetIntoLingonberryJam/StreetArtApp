import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/other/app_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    final user = await Utils.of(context).showLoading(UserService.login(
      email: loginController.text.trim(),
      password: passwordController.text.trim(),
    ));

    if (mounted && user != null) {
      context.read<UserProvider>().setUser(user);
      Navigator.of(context).pop();
    }
  }

  void _tryLogin() {
    if (formKey.currentState?.validate() ?? false) {
      _login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormField(
            controller: loginController,
            hintText: 'Почта',
            validator: Validator.get(Validate.email),
          ),
          const SizedBox(height: 10),
          AppTextFormField.withToggleEye(
            controller: passwordController,
            hintText: 'Пароль',
            validator: Validator.get(Validate.password),
          ),
          const SizedBox(height: 60),
          AppButton.primary(onTap: _tryLogin, label: 'Войти в профиль'),
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
