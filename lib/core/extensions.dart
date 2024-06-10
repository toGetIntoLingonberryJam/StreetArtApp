import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/wide_screen/wide_home_controller.dart';

extension GetToExtension<T extends GetxController> on T {
  T get to => Get.find<T>();
}

extension ContextExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

void openScreen(Widget screen) {
  if (kIsWeb) {
    Get.find<WideHomeController>().openScreen(screen);
  } else {
    Get.to(screen);
  }
}

void closeScreen() {
  if (kIsWeb) {
    Get.find<WideHomeController>().back();
  } else {
    Get.back();
  }
}

void replaceScreen(Widget screen) {
  if (kIsWeb) {
    Get.find<WideHomeController>().replaceScreen(screen);
  } else {
    Get.off(screen);
  }
}

void replaceAllScreens(Widget screen) {
  if (kIsWeb) {
    Get.find<WideHomeController>().replaceAllScreens(screen);
  } else {
    Get.offAll(screen);
  }
}
