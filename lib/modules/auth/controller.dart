import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/modules/auth/views/login_form.dart';
import 'package:street_art_witnesses/modules/auth/views/register_form.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';

enum AuthForm { login, register }

class AuthController extends GetxController {
  AuthForm form = AuthForm.login;
  final userService = Get.find<UserService>();

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
      await Utils.of(context).showLoading(userService.login(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      ));
      Get.back();
    }
  }

  void tryRegister(BuildContext context) async {
    if (registerFormKey.currentState?.validate() ?? false) {
      await Utils.of(context).showLoading(userService.register(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        username: usernameCtrl.text.trim(),
      ));
      Get.back();
    }
  }
}
