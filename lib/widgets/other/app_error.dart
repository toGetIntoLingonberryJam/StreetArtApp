import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppHeader(title: 'Ошибка'),
      body: Padding(
        padding: kPagePadding,
        child: Column(
          children: [
            Spacer(),
            AppErrorWidget(),
            Spacer(),
            AppButton.primary(label: 'Назад', onTap: closeScreen),
          ],
        ),
      ),
    );
  }
}

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Что-то пошло не так. :(',
        style: NewTextStyles.title3Regular,
      ),
    );
  }
}
