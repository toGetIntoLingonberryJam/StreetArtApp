import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/api_service.dart';
import 'package:street_art_witnesses/src/widgets/my_text_form_field.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  void _login() async {
    final user = await Utils.showLoading(
        context,
        ApiService.login(
          email: loginController.text.trim(),
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
            hintText: 'Почта',
          ),
          const SizedBox(height: 25),
          MyTextFormField(
            controller: passwordController,
            hintText: 'Пароль',
          ),
          const SizedBox(height: 60),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size(300, 45),
            ),
            onPressed: _login,
            child: const Text(
              'Войти в профиль',
              style: TextStyle(fontSize: 17),
            ),
          ),
          const SizedBox(height: 20),
          _forgotPasswordButton(),
        ],
      ),
    );
  }

  GestureDetector _forgotPasswordButton() {
    return GestureDetector(
      onTap: () => print('Forgot password pressed'),
      child: const Text(
        'Забыли пароль?',
        style: TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }
}
