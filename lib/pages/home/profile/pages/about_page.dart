import 'dart:io';

import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kPagePadding,
          child: Column(
            children: [
              const AppAppbar(title: 'О нас'),
              const SizedBox(height: 20),
              Image.asset('assets/jam_logo.png', width: 128, height: 128),
              const SizedBox(height: 40),
              const AppContainer(
                  child: Text(
                'Приложение разработано командой (to) Get Into Lingonberry Jam в рамках Проектного Практикума УрФУ.\n\nВ проекте принимали участие:\nРоманов Вадим Юрьевич\nПотехин Николай Андреевич\nБиккужина Полина Дмитриевна\nЧислов Степан Игоревич\n\nИз Екб, с любовью <3',
                style: TextStyles.text,
              )),
              const SizedBox(height: 16),
              const _VersionWidget(),
              const SizedBox(height: 12),
              AppButton.primary(
                onTap: () => Utils.of(context).tryLaunchUrl(
                  Uri.parse('https://forms.gle/s64bkob2reo6d3th8'),
                ),
                label: 'Обратная связь',
              ),
              const SizedBox(height: 8),
              AppButton.primary(
                onTap: () => Utils.of(context).tryLaunchUrl(Uri.parse('https://t.me/sfchv1')),
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
    return const AppContainer.small(
      child: Row(
        children: [
          Text('Версия приложения:', style: TextStyles.headline2),
          SizedBox(width: 10),
          // TODO: Change VERSION name
          Text('0.8.1', style: TextStyles.text),
        ],
      ),
    );
  }
}
