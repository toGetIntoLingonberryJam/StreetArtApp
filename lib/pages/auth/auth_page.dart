import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/auth/auth_form/login_form.dart';
import 'package:street_art_witnesses/pages/auth/auth_form/register_form.dart';
import 'package:street_art_witnesses/src/widgets/app_button.dart';
import 'package:street_art_witnesses/src/widgets/app_logo.dart';

enum AuthForm { login, register }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthForm authForm = AuthForm.login;

  void _switchToLogin() => setState(() => authForm = AuthForm.login);

  void _switchToRegister() => setState(() => authForm = AuthForm.register);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 45),
                child: AppLogo(),
              ),
              Row(
                children: [
                  Expanded(
                    child: authForm == AuthForm.login
                        ? AppButton.primary(
                            onTap: _switchToLogin,
                            child: const Text('Вход'),
                          )
                        : AppButton.secondary(
                            onTap: _switchToLogin,
                            child: const Text('Вход'),
                          ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: authForm == AuthForm.register
                        ? AppButton.primary(
                            onTap: _switchToRegister,
                            child: const Text('Регистрация'),
                          )
                        : AppButton.secondary(
                            onTap: _switchToRegister,
                            child: const Text('Регистрация'),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              authForm == AuthForm.login
                  ? const LoginView()
                  : const RegisterView(),
            ],
          ),
        ),
      ),
    );
  }
}
