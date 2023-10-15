import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/api_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/src/widgets/my_text_form_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTextFormField(
            controller: loginController,
            hintText: 'Придумайте логин',
          ),
          const SizedBox(height: 25),
          MyTextFormField(
            controller: emailController,
            hintText: 'Введите почту',
          ),
          const SizedBox(height: 25),
          MyTextFormField(
            controller: passwordController,
            hintText: 'Введите пароль',
          ),
          const SizedBox(height: 25),
          MyTextFormField(
            controller: passwordConfirmController,
            hintText: 'Повторите пароль',
          ),
          const SizedBox(height: 60),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size(300, 45),
            ),
            onPressed: _register,
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
