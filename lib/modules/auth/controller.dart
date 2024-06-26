import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/auth/views/login.dart';
import 'package:street_art_witnesses/modules/auth/views/register.dart';
import 'package:street_art_witnesses/modules/home/screen.dart';
import 'package:street_art_witnesses/modules/user/screen.dart';
import 'package:street_art_witnesses/modules/wide_screen/wide_home_controller.dart';

enum AuthForm { login, register }

class AuthController extends GetxController {
  AuthForm form = AuthForm.login;
  final userService = Get.find<AuthService>();

  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordConfirmCtrl = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  Widget get view {
    switch (form) {
      case AuthForm.login:
        return const LoginView();
      case AuthForm.register:
        return const RegisterView();
    }
  }

  @override
  void onClose() {
    usernameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    passwordConfirmCtrl.dispose();
    super.onClose();
  }

  void switchForm(AuthForm form) {
    this.form = form;
    update();
  }

  void tryLogin(BuildContext context) async {
    if (loginFormKey.currentState?.validate() ?? false) {
      final success = await Utils.showLoading(userService.login(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      ));
      Logger.d(success.toString());
      if (success ?? false) {
        if (kIsWeb) {
          Get.find<WideHomeController>().replaceAllScreens(const ProfileScreen());
        } else {
          replaceAllScreens(const HomeScreen());
        }
      }
    }
  }

  void tryRegister(BuildContext context) async {
    if (registerFormKey.currentState?.validate() ?? false) {
      final success = await Utils.showLoading(userService.register(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        username: usernameCtrl.text.trim(),
      ));
      if (success ?? false) {
        if (kIsWeb) {
          Get.find<WideHomeController>().replaceAllScreens(const ProfileScreen());
        } else {
          replaceAllScreens(const HomeScreen());
        }
      }
    }
  }
}
