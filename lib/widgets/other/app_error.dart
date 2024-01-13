import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              const AppAppbar(title: 'Ошибка'),
              const Expanded(child: SizedBox()),
              const AppErrorWidget(),
              const Expanded(child: SizedBox()),
              AppButton.primary(
                label: 'Назад',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
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
        style: TextStyles.headline1,
      ),
    );
  }
}
