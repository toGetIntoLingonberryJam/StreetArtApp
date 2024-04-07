import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/auth/screen.dart';
import 'package:street_art_witnesses/modules/home/screen.dart';

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
                child: SALogo(),
              ),
              const SizedBox(height: 40),
              const Text(
                'Свидетели Стрит-Арта',
                style: SATextStyles.title1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                content,
                style: SATextStyles.text,
                textAlign: TextAlign.center,
              ),
              const Expanded(flex: 2, child: SizedBox()),
              SAPrimaryButton(
                onTap: () => Get.to(() => AuthScreen()),
                label: 'Войти в профиль',
              ),
              const SizedBox(height: 12),
              SASecondaryButton(onTap: () => Get.to(() => const HomeScreen()), label: 'Позже'),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
