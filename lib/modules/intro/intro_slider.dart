import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/home/screen.dart';
import 'package:street_art_witnesses/modules/intro/intro_auth_page.dart';
import 'package:street_art_witnesses/modules/intro/intro_page.dart';
import 'package:street_art_witnesses/widgets/other/slider_dots.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({super.key});

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final controller = PageController();
  int pageIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              _skipButton(),
              Expanded(
                child: PageView(
                  onPageChanged: (page) {
                    setState(() {
                      pageIndex = page;
                    });
                  },
                  controller: controller,
                  children: [
                    IntroPage(
                      onButtonClicked: _nextPage,
                      content: 'Добро пожаловать в приложение "Свидетели стрит-арта"!',
                    ),
                    IntroPage(
                      onButtonClicked: _nextPage,
                      content: 'Откройте для себя удивительный мир стрит-арта с нашим приложением!',
                    ),
                    const IntroAuthPage(
                      content: "Присоединяйтесь к нам, чтобы сохранять и делиться своими впечатлениями о стрит-арте",
                    ),
                  ],
                ),
              ),
              SliderDots(count: 3, activeIndex: pageIndex),
            ],
          ),
        ),
      ),
    );
  }

  Padding _skipButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        const Expanded(child: SizedBox()),
        GestureDetector(
          onTap: () => Get.off(() => const HomeScreen()),
          child: const Text('Пропустить', style: NewTextStyles.footnoteRegular),
        ),
      ]),
    );
  }
}
