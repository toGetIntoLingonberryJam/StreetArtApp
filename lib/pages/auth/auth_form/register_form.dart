import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/api_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/src/utils/validator.dart';
import 'package:street_art_witnesses/src/widgets/app_button.dart';
import 'package:street_art_witnesses/src/widgets/app_text_form_field.dart';

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
    final user = await Utils.showLoading(
        context,
        ApiService.register(
          username: loginController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ));

    if (mounted && user != null) {
      context.read<UserProvider>().updateUser(user);
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
            validate: Validate.login,
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            controller: emailController,
            hintText: 'Введите почту',
            validate: Validate.email,
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            controller: passwordController,
            hintText: 'Введите пароль',
            validate: Validate.password,
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            controller: passwordConfirmController,
            hintText: 'Повторите пароль',
            validate: Validate.password,
          ),
          const SizedBox(height: 60),
          AppButton.primary(
            onTap: _tryRegister,
            child: const Text(
              'Зарегистрироваться',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
