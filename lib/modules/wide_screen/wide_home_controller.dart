import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/modules/user/screen.dart';

class WideHomeController extends GetxController {
  final screens = Queue<Widget>.from([const ProfileScreen()]);

  Widget get currentScreen => screens.last;

  void openScreen(Widget screen) {
    screens.add(screen);
    Logger.d('current screen is $screen');
    update();
  }

  void replaceScreen(Widget screen) {
    screens.add(screen);
    Logger.d('current screen is $screen');
    update();
  }

  void replaceAllScreens(Widget screen) {
    screens.add(screen);
    Logger.d('current screen is $screen');
    update();
  }

  void back() {
    if (screens.length > 1) {
      screens.removeLast();
      update();
    }
  }
}
