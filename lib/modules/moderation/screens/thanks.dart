import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/values/constants.dart';

class ModerationThanksScreen extends StatelessWidget {
  const ModerationThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      title: 'Спасибо!',
      paddings: kPagePadding,
      body: Column(
        children: [
          const SizedBox(height: 60),
          ClipRRect(
            borderRadius: BorderRadius.circular(kContainerRadius),
            child: const SAPlaceholder(height: 320),
          ),
          const Expanded(child: SizedBox()),
          const Text('Спасибо!', style: SATextStyles.title1, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          const Text(
            'Ваша заявка на добавление работы отправлена на модерацию.',
            style: SATextStyles.text,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SACustomButton.filled(
            child: Text(
              'На главный экран',
              style: SATextStyles.button.copyWith(color: Colors.black),
            ),
            onTap: () => Navigator.pop(context),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
