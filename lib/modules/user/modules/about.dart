import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      title: 'О нас',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kPagePadding,
          child: Column(
            children: [
              Image.asset('assets/jam_logo.png', width: 128, height: 128),
              const SizedBox(height: 40),
              const SAContainer(
                  child: Text(
                'Приложение разработано командой (to) Get Into Lingonberry Jam в рамках Проектного Практикума УрФУ.\n\nВ проекте принимали участие:\nРоманов Вадим Юрьевич\nПотехин Николай Андреевич\nБиккужина Полина Дмитриевна\nЧислов Степан Игоревич\n\nИз Екб, с любовью <3',
                style: SATextStyles.text,
              )),
              const SizedBox(height: 16),
              const _VersionWidget(),
              const SizedBox(height: 12),
              SAPrimaryButton(
                onTap: () => Utils.tryLaunchUrl(reportLink),
                label: 'Обратная связь',
              ),
              const SizedBox(height: 8),
              SAPrimaryButton(
                onTap: () => Utils.tryLaunchUrl(contactLink),
                label: 'Связаться с нами',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VersionWidget extends StatelessWidget {
  const _VersionWidget();

  @override
  Widget build(BuildContext context) {
    return const SAContainer.small(
      child: Row(
        children: [
          Text('Версия приложения:', style: SATextStyles.headline2),
          SizedBox(width: 10),
          // TODO: Change VERSION name
          Text('0.11.1', style: SATextStyles.text),
        ],
      ),
    );
  }
}
