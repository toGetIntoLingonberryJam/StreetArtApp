import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/services/package_service.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'О нас'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kPagePadding,
          child: Column(
            children: [
              Image.asset('assets/jam_logo.png', width: 128, height: 128),
              const SizedBox(height: 40),
              const AppContainer(
                  child: Text(
                'Приложение разработано командой (to) Get Into Lingonberry Jam в рамках Проектного Практикума УрФУ.\n\nВ проекте принимали участие:\nРоманов Вадим Юрьевич\nПотехин Николай Андреевич\nБиккужина Полина Дмитриевна\nЧислов Степан Игоревич\n\nИз Екб, с любовью <3',
                style: NewTextStyles.bodyRegular,
              )),
              const SizedBox(height: Paddings.normal),
              const _VersionWidget(),
              const SizedBox(height: 12),
              AppButton.primary(
                onTap: () => Utils.tryLaunchUrl(reportLink),
                label: 'Обратная связь',
              ),
              const SizedBox(height: Paddings.normal),
              AppButton.primary(
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
    return AppContainer(
      child: Row(
        children: [
          const Text('Версия приложения:', style: NewTextStyles.bodyRegular),
          const SizedBox(width: 10),
          Text(Get.find<PackageInfoService>().packageInfo.version, style: NewTextStyles.bodyRegular),
        ],
      ),
    );
  }
}
