import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/auth/auth_view/login_view.dart';
import 'package:street_art_witnesses/pages/auth/auth_view/register_view.dart';

enum AuthType { login, register }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthType authType = AuthType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Image(
                  width: 150,
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => authType = AuthType.login),
                    child: Text('Вход',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: authType == AuthType.login
                              ? FontWeight.bold
                              : FontWeight.normal,
                        )),
                  ),
                  const SizedBox(width: 70),
                  GestureDetector(
                    onTap: () => setState(() => authType = AuthType.register),
                    child: Text('Регистрация',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: authType == AuthType.register
                              ? FontWeight.bold
                              : FontWeight.normal,
                        )),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: authType == AuthType.login
                      ? const LoginView()
                      : const RegisterView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
