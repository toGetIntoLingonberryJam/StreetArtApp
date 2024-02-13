import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/user/screens/settings/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              AppAppbar(title: 'Настройки'),
              SizedBox(height: 20),
              _ThemeSettings(),
              SizedBox(height: 8),
              _QualitySettings(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeSettings extends StatelessWidget {
  const _ThemeSettings();

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Тема', style: TextStyles.headline1),
          const SizedBox(height: 8),
          _Option(title: 'Системная', onTap: () {}, isChecked: true),
        ],
      ),
    );
  }
}

class _QualitySettings extends StatelessWidget {
  const _QualitySettings();

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: GetBuilder<SettingsController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Качество изображений', style: TextStyles.headline1),
              const SizedBox(height: 8),
              _Option(
                onTap: () => controller.setImageQuality(ImageQuality.bad),
                title: 'Плохое',
                isChecked: controller.imageQuality == ImageQuality.bad,
              ),
              const SizedBox(height: 4),
              _Option(
                onTap: () => controller.setImageQuality(ImageQuality.good),
                title: 'Хорошее',
                isChecked: controller.imageQuality == ImageQuality.good,
              ),
              const SizedBox(height: 4),
              _Option(
                onTap: () => controller.setImageQuality(ImageQuality.best),
                title: 'Лучшее',
                isChecked: controller.imageQuality == ImageQuality.best,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    required this.title,
    this.onTap,
    this.isChecked = false,
  });

  final String title;
  final VoidCallback? onTap;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(child: Text(title, style: TextStyles.text)),
              if (isChecked) const Icon(Icons.check),
            ],
          ),
        ),
      ),
    );
  }
}
