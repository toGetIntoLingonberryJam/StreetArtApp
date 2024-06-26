import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

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
              const Text(
                'Свидетели Стрит-Арта',
                style: NewTextStyles.largeTitleRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(content, style: NewTextStyles.bodyRegular, textAlign: TextAlign.center),
              const Expanded(flex: 2, child: SizedBox()),
              AppButton.primary(onTap: onButtonClicked, label: 'Далее'),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
