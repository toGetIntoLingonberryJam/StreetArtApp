import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/other/app_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final loginController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    loginController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  void _register() async {
    final user = await Utils.of(context).showLoading(UserService.register(
      username: loginController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    ));

    if (mounted && user != null) {
      context.read<UserProvider>().setUser(user);
      Navigator.of(context).pop();
    }
  }

  void _tryRegister() {
    if (formKey.currentState?.validate() ?? false) {
      _register();
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
            hintText: 'Придумайте логин',
            validator: Validator.get(Validate.login),
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            controller: emailController,
            hintText: 'Введите почту',
            validator: Validator.get(Validate.email),
          ),
          const SizedBox(height: 10),
          AppTextFormField.withToggleEye(
            controller: passwordController,
            hintText: 'Введите пароль',
            validator: Validator.get(Validate.password),
          ),
          const SizedBox(height: 10),
          AppTextFormField.withToggleEye(
            controller: passwordConfirmController,
            hintText: 'Повторите пароль',
            validator: (String? password) {
              if (passwordController.text != passwordConfirmController.text) {
                return 'Пароли не совпадают';
              }
              return Validator.get(Validate.password)!(password);
            },
          ),
          const SizedBox(height: 60),
          AppButton.primary(onTap: _tryRegister, label: 'Зарегистрироваться'),
        ],
      ),
    );
  }
}
