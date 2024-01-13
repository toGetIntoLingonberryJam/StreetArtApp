part of 'moderation_page.dart';

class _ThanksScreen extends StatelessWidget {
  const _ThanksScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppPlaceholder(height: 320),
              const Expanded(child: SizedBox()),
              const Text('Спасибо!', style: TextStyles.title1, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              const Text(
                'Ваша заявка на добавление работы отправлена на модерацию.',
                style: TextStyles.text,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              AppCustomButton.filled(
                child: Text(
                  'На главный экран',
                  style: TextStyles.button.copyWith(color: Colors.black),
                ),
                onTap: () => Navigator.pop(context),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
