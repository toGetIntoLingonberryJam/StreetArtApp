import 'dart:io';

import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/app_appbar.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';

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
              const AppAppbar(title: 'О Нас'),
              const SizedBox(height: 20),
              Image.asset('assets/jam_logo.png', width: 128, height: 128),
              const SizedBox(height: 40),
              const AppContainer(
                  child: Text(
                'Приложение разработано командой (to) Get Into Lingonberry Jam в рамках Проектного Практикума УрФУ.\n\nВ проекте принимали участие:\nРоманов Вадим Юрьевич\nПотехин Николай Андреевич\nБиккужина Полина Дмитриевна\nЧислов Степан Игоревич\n\nИз Екб, с любовью <3',
                style: TextStyles.text,
              )),
              const SizedBox(height: 4),
              AppButton.primary(onTap: () {}, text: 'Обратная связь'),
              AppButton.primary(onTap: () {}, text: 'Связаться с нами'),
              AppButton.secondary(onTap: () => exit(0), text: 'Откинуться'),
              const SizedBox(height: 40),
              const AppContainer.small(
                child: Row(
                  children: [
                    Text('Версия приложения:', style: TextStyles.headline2),
                    SizedBox(width: 10),
                    // TODO: Change VERSION name
                    Text('0.5.0', style: TextStyles.text),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
