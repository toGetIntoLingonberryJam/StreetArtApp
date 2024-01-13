part of 'moderation_page.dart';

class _WarningScreen extends StatelessWidget {
  const _WarningScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              const AppAppbar(title: ''),
              const SizedBox(height: 20),
              const Expanded(child: SizedBox()),
              const Text(
                'Добавление работы',
                style: TextStyles.title1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                'Перед публикацией, все заявки на добавление работ проходят проверку. Это помогает поддерживать высокое качество контента в нашем приложении.\n\nКак только ваша заявка будет одобрена, ваша работа будет опубликована и станет доступна для всех пользователей.\n\nСпасибо за понимание!',
                style: TextStyles.text,
                textAlign: TextAlign.center,
              ),
              const Expanded(child: SizedBox()),
              AppButton.primary(
                text: 'Я ознакомился',
                onTap: () => context.read<ModerationCubit>().showEdit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
