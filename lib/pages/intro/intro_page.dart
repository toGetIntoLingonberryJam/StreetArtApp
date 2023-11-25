import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/src/widgets/app_logo.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    super.key,
    required this.onButtonClicked,
    required this.content,
  });

  final VoidCallback onButtonClicked;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Expanded(
                flex: 4,
                child: AppLogo(),
              ),
              const SizedBox(height: 40),
              Text(
                'Свидетели Стрит-Арта',
                style: TextStyles.body.w700,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                content,
                style: TextStyles.headlines.w400,
                textAlign: TextAlign.center,
              ),
              const Expanded(flex: 2, child: SizedBox()),
              AppButton.primary(
                onTap: onButtonClicked,
                child: Text('Далее', style: TextStyles.headlines.w400),
              ),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
