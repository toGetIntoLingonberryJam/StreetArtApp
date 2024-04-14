import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension GetToExtension<T extends GetxController> on T {
  T get to => Get.find<T>();
}

extension ContextExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
