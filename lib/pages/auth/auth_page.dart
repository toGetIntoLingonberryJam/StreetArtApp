import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/auth/auth_form/login_form.dart';
import 'package:street_art_witnesses/pages/auth/auth_form/register_form.dart';

enum AuthForm { login, register }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthForm authForm = AuthForm.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 45),
                child: Image(
                  width: 150,
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => authForm = AuthForm.login),
                    child: Text('Вход',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: authForm == AuthForm.login
                              ? FontWeight.bold
                              : FontWeight.normal,
                        )),
                  ),
                  const SizedBox(width: 70),
                  GestureDetector(
                    onTap: () => setState(() => authForm = AuthForm.register),
                    child: Text('Регистрация',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: authForm == AuthForm.register
                              ? FontWeight.bold
                              : FontWeight.normal,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
