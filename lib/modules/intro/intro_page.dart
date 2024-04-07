import 'package:street_art_ui_kit/street_art_ui_kit.dart';

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
                child: SALogo(),
              ),
              const SizedBox(height: 40),
              const Text(
                'Свидетели Стрит-Арта',
                style: SATextStyles.title1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(content, style: SATextStyles.text, textAlign: TextAlign.center),
              const Expanded(flex: 2, child: SizedBox()),
              SAPrimaryButton(onTap: onButtonClicked, label: 'Далее'),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
