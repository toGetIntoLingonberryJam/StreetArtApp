import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/auth/controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

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
          child: GetBuilder<AuthController>(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 45),
                  child: SALogo(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: controller.form == AuthForm.login
                          ? SAPrimaryButton(
                              onTap: () => controller.switchForm(AuthForm.login),
                              label: 'Вход',
                            )
                          : SASecondaryButton(
                              onTap: () => controller.switchForm(AuthForm.login),
                              label: 'Вход',
                            ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: controller.form == AuthForm.register
                          ? SAPrimaryButton(
                              onTap: () => controller.switchForm(AuthForm.register),
                              label: 'Регистрация',
                            )
                          : SASecondaryButton(
                              onTap: () => controller.switchForm(AuthForm.register),
                              label: 'Регистрация',
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                controller.view,
              ],
            );
          }),
        ),
      ),
    );
  }
}
