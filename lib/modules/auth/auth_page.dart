import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/auth/controller.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/other/app_logo.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final controller = Get.put(AuthController());

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
                    child: controller.form == AuthForm.login
                        ? AppButton.primary(
                            onTap: () => controller.switchForm(AuthForm.login),
                            label: 'Вход',
                          )
                        : AppButton.secondary(
                            onTap: () => controller.switchForm(AuthForm.login),
                            label: 'Вход',
                          ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: controller.form == AuthForm.register
                        ? AppButton.primary(
                            onTap: () => controller.switchForm(AuthForm.register),
                            label: 'Регистрация',
                          )
                        : AppButton.secondary(
                            onTap: () => controller.switchForm(AuthForm.register),
                            label: 'Регистрация',
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              controller.view,
            ],
          ),
        ),
      ),
    );
  }
}
