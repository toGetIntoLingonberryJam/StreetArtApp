import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/auth/forms/login_form.dart';
import 'package:street_art_witnesses/pages/auth/forms/register_form.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/other/app_logo.dart';

enum _Form { login, register }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  _Form authForm = _Form.login;

  void _switchToLogin() => setState(() => authForm = _Form.login);

  void _switchToRegister() => setState(() => authForm = _Form.register);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 40,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: kPagePadding,
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
                    child: authForm == _Form.login
                        ? AppButton.primary(onTap: _switchToLogin, text: 'Вход')
                        : AppButton.secondary(
                            onTap: _switchToLogin, text: 'Вход'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: authForm == _Form.register
                        ? AppButton.primary(
                            onTap: _switchToRegister, text: 'Регистрация')
                        : AppButton.secondary(
                            onTap: _switchToRegister, text: 'Регистрация'),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              authForm == _Form.login
                  ? const LoginView()
                  : const RegisterView(),
            ],
          ),
        ),
      ),
    );
  }
}
