import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/auth/screen.dart';
import 'package:street_art_witnesses/modules/home/screen.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class IntroAuthPage extends StatelessWidget {
  const IntroAuthPage({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Expanded(
                flex: 4,
                child: AppLogo(),
              ),
              const SizedBox(height: 40),
              const Text(
                'Свидетели Стрит-Арта',
                style: TextStyles.title1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                content,
                style: TextStyles.text,
                textAlign: TextAlign.center,
              ),
              const Expanded(flex: 2, child: SizedBox()),
              AppButton.primary(
                onTap: () => Get.to(() => const AuthScreen()),
                label: 'Войти в профиль',
              ),
              const SizedBox(height: 12),
              AppButton.secondary(
                onTap: () => Get.to(() => const HomeScreen()),
                label: 'Позже',
              ),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
