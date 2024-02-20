import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';

class EmailCounterController extends GetxController {
  EmailCounterController({required this.durationInSeconds});

  // When opening first time, send mail automatically and show update button
  bool firstOpened = true;
  bool showUpdateButton = false;

  void reset() {
    firstOpened = true;
    showUpdateButton = false;
  }

  final int durationInSeconds;
  StreamSubscription? subscription;

  bool get canSend => _count == 0;

  int _count = 0;
  int get count => _count;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void _tick() {
    _count -= 1;
    update();
  }

  void _initCounting() {
    subscription?.cancel();
    subscription =
        Stream.periodic(const Duration(seconds: 1)).take(durationInSeconds).listen((e) => _tick());
    _count = durationInSeconds;
  }

  Future<void> sendEmail(BuildContext context, String email) async {
    if (canSend) {
      _initCounting();
      firstOpened = false;
      showUpdateButton = true;
      final success = await Get.find<AuthService>().verify(email: email);

      if (context.mounted) {
        if (success == true) {
          Utils.showMessage('Письмо успешно отправлено');
        } else if (success == false) {
          Utils.showError('Произошла ошибка при отправке письма');
        }
      }
      update();
    }
  }
}
